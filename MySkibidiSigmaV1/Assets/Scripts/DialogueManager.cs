using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
using UnityEngine.SceneManagement;
using UnityEngine.EventSystems;
// using Ink.

public class DialogueManager : MonoBehaviour
{
    
    // general dialogue handline
    // [SerializeField] public bool dialogueIsPlaying { get; private set; }
     [SerializeField] public bool dialogueIsPlaying;
    private static DialogueManager instance;
    [Header("Dialogue UI")] //all visible fields
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private TextMeshProUGUI NPCName;
    [SerializeField] private TextMeshProUGUI playerName;
    [SerializeField] private TextMeshProUGUI speakerName;
    [SerializeField] private TextMeshProUGUI auraText;
    public int auraTextValue; //alters info above (shared across the game)
    [SerializeField] public TextMeshProUGUI playerTitle; // shared across the game
    // Ink behind the scenes
    [SerializeField] private Story currentStory;
    [SerializeField] private TextAsset inkJSON;
    private const string IMPACT_TAG = "impact";
    private const string SPEAKER_TAG = "speaker";

    [Header("Choices UI")] // visible choices
    [SerializeField] private GameObject[] choices;
    private TextMeshProUGUI[] choicesText; // alters info above
    
    
    //audio 
    [SerializeField] private AudioSource audioSource; // plays positive audio when a good choice is made
    public AudioClip positiveImpact; // the clip that plays
    public AudioClip negativeImpact; // the clip that plays


    private void Awake()
    {
        if (instance != null && instance != this)
        {
            Destroy(this.gameObject);
            return;
            // Debug.LogWarning("Found multiple Dialogue Managers");
        }
        instance = this;
    }
    public static DialogueManager GetInstance(){
        return instance;
    }
    private void Start()
    {
        dialogueIsPlaying = false;

    }
    private void Update(){
        playerTitle = GameObject.Find("PlayerTitleText").GetComponent<TextMeshProUGUI>();
        auraText = GameObject.Find("AuraText").GetComponent<TextMeshProUGUI>();
        GameManager.GetInstance().playerTitle = GameObject.Find("PlayerTitleText").GetComponent<TextMeshProUGUI>();
        GameManager.GetInstance().auraText = GameObject.Find("AuraText").GetComponent<TextMeshProUGUI>();
        
        playerTitle.text = GameManager.GetInstance().TitleSwapper(auraTextValue);
        auraText.text = "Aura: " + auraTextValue;
        
        // don't do anything if the dialogue isn't playing
        if (!dialogueIsPlaying)
        {
            return;
        }
        if (dialogueIsPlaying)
        {
           // fixes a bug where the mouse traps you in dialogue mode
            if (Input.GetMouseButtonDown(0) || Input.GetMouseButtonDown(1) || Input.GetMouseButtonDown(2))
                {
                    EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
                }
        }
        // allows user to more quickly move on
        if (currentStory.currentChoices.Count == 0 &&
            (Input.GetKeyUp(KeyCode.Space) || Input.GetKeyUp(KeyCode.Return)))
        {
            ContinueStory();
        }
    }
    
    public void EnterDialogueMode(TextAsset inkJSON)
    {
        auraTextValue = GameManager.GetInstance().auraTextValue;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        dialogueIsPlaying = true;
        Debug.Log("dialogue is playing");
        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach(GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
        currentStory = new Story(inkJSON.text);
        

        ContinueStory();
    }

    private IEnumerator ExitDialogueMode()
    {
        yield return new WaitForSeconds(0.2f);
        dialogueIsPlaying = false;
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        GameManager.GetInstance().SetAura(auraTextValue);
        dialogueText.text="";
        GameManager.GetInstance().dialogueCalled = false;
        StartCoroutine(GameManager.GetInstance().StartGame());
        SceneManager.LoadScene("SampleScene");
        
        
    }


    
    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            dialogueText.text = currentStory.Continue();
            speakerName.text = SwapSpeaker(speakerName.text);
            DisplayChoices();
            HandleTags(currentStory.currentTags);
        }
        else
        {
            StartCoroutine(ExitDialogueMode());
        }
    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices;
        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("Too many choices in script for UI");
        }

        int index = 0;
        foreach(Choice choice in currentChoices)
        {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }
        for (int i = index; i < choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }
        StartCoroutine(SelectFirstChoice());
    }

    private IEnumerator SelectFirstChoice()
    {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
        
    }

    public void MakeChoice(int choiceIndex)
    {
        currentStory.ChooseChoiceIndex(choiceIndex);
    }

    public string SwapSpeaker(string speakerName)
    {
        if (speakerName == playerName.text)
        {
            return NPCName.text;
        }
        else 
        {
            if (speakerName == NPCName.text)
            {
                return playerName.text;
            }

        }
        return speakerName;
    }

    private void HandleTags(List<string> currentTags)
    {

        foreach (string tag in currentTags)
        {
            string[] splitTag = tag.Split(':');
            if(splitTag.Length !=2)
            {
                Debug.Log("Tag could not be properly parsed:" + tag);
            }
            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();  

            switch(tagKey)
            {
                case IMPACT_TAG:
                    Debug.Log("this had a " + tagValue + " impact.");
                    ImpactHandler(tagValue);
                    break;
                case SPEAKER_TAG:
                // speaker tag is only called when one speaker needs to talk for multiple lines, logic breaks otherwise
                // can also swap to other entities if dialogue calls for it
                    Debug.Log("speaker tag called");
                    if (tagValue == NPCName.text)
                    {
                        speakerName.text = SwapSpeaker(playerName.text);
                    } else
                    {
                        if (tagValue == playerName.text)
                        {
                            speakerName.text = SwapSpeaker(NPCName.text);
                        }
                        else {
                            speakerName.text = SwapSpeaker(tagValue);
                            Debug.Log("swapped speaker to " + tagValue);
                        }
                    }
                    break;
                default:
                    Debug.LogWarning("Tag read but not handled");
                    break;

            }
        }
    }

    private void ImpactHandler(string tagValue)
    {
        switch(tagValue)
        {
            case "great":
                auraTextValue = auraTextValue + 100;
                audioSource.PlayOneShot(positiveImpact, 1.0f); // pos sound
                break;
            case "good":
                auraTextValue = auraTextValue + 50;
                audioSource.PlayOneShot(positiveImpact, 1.0f); // pos sound
                break;
            case "neutral":
                break;
            case "bad":
                auraTextValue = auraTextValue -50;
                audioSource.PlayOneShot(negativeImpact, 1.0f);// neg sound
                break;
            case "cringe":
                auraTextValue = auraTextValue - 100;
                audioSource.PlayOneShot(negativeImpact, 1.0f);// neg sound
                break;
            case "creep":
                auraTextValue = auraTextValue -200;
                audioSource.PlayOneShot(negativeImpact, 1.0f);// neg sound
                break;
            default:
                Debug.LogWarning("Error while reading impact tag, possible typo");
                break;
        }
    }

    

}
