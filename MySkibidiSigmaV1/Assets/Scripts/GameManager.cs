using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    private static GameManager instance;

    public string playerName = "Y/N"; // the name of the person playing the game (gives a little personality to the game)

    [SerializeField] public TextMeshProUGUI auraText; // shows the current aura of the player
    public int auraTextValue; //alters info above (shared across the game)
    [SerializeField] public TextMeshProUGUI playerTitle; // shared across the game
    public bool dialogueCalled = false; // tells the game manager what type of scene it is in

    /* controls the dialogue */
    [Header("Dialogue Select")]
    [SerializeField] private TextAsset SabrineDialogue;
    [SerializeField] public TextAsset currentDialogue;
    [SerializeField] public string currentDialogueScene;
    [SerializeField] private GameObject statusBar;

    /* Title Screen Handling */
    [Header("Title Screen UI")]
    [SerializeField] private GameObject titleScreen;
    [SerializeField] private Button startButton;
    [SerializeField] private Button settingsButton;
    [SerializeField] private Button exitButton;


// called when GameManager is in a new scene
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

// helper for the instance
     public static GameManager GetInstance(){
        return instance;
    }

// called only when the game is started
    void Start()
    {
        dialogueCalled = false;
        playerTitle = GameObject.Find("PlayerTitleText").GetComponent<TextMeshProUGUI>();
        auraText = GameObject.Find("AuraText").GetComponent<TextMeshProUGUI>();
        titleScreen.gameObject.SetActive(true);
        statusBar.gameObject.SetActive(false);
    }

// called when the start button is pressed
    public void ButtonStart()
    {
        StartCoroutine(StartGame());
    }

// called when you enter the library from any other scene
    public IEnumerator StartGame()
    {
        yield return new WaitForSeconds(1.0f);
        if (titleScreen != null) {titleScreen.gameObject.SetActive(false);}
        if (statusBar != null) {statusBar.gameObject.SetActive(true); }
        playerTitle = GameObject.Find("PlayerTitleText").GetComponent<TextMeshProUGUI>();
        auraText = GameObject.Find("AuraText").GetComponent<TextMeshProUGUI>();
        // start the rest of the game
    }

// shows the settings to update the game
    void ShowSettingsMenu()
    {
        // show settings menu
        //TODO: Add a name changer, a volume mute button.

    }

// quits the game
    public void ExitGame()
    {
        // close the game
        Debug.Log("Game Quit");
        Application.Quit();
    }

// is called every frame
    void FixedUpdate() 
    {
    if (auraText == null)
        auraText = GameObject.Find("AuraText").GetComponent<TextMeshProUGUI>();
    if (playerTitle == null)
        playerTitle = GameObject.Find("PlayerTitleText").GetComponent<TextMeshProUGUI>();

    if (dialogueCalled == false){
            playerTitle.text = "Current Title: " + TitleSwapper(auraTextValue);
            auraText.text = "Aura: " + auraTextValue;
        } else {
            StartCoroutine(LoadDialogueSceneAsync(SabrineDialogue, currentDialogueScene));
            playerTitle = GameObject.Find("PlayerTitleText").GetComponent<TextMeshProUGUI>();
            auraText = GameObject.Find("AuraText").GetComponent<TextMeshProUGUI>();
            dialogueCalled = false;
        }
}


/* Helper Functions */


// makes sure the correct dialogue is being called with the correct scene
    private IEnumerator LoadDialogueSceneAsync(TextAsset currentDialogue, string chosenScene)
    {
        // Load the Dialogue1 scene asynchronously
        AsyncOperation asyncLoad = SceneManager.LoadSceneAsync(chosenScene);

        // Wait until the scene is fully loaded
        while (!asyncLoad.isDone)
        {
            yield return null;
        }

        // Now safely call DialogueManager
        DialogueManager dialogueManager = DialogueManager.GetInstance();
        if (dialogueManager != null)
        {
            dialogueManager.EnterDialogueMode(currentDialogue);
        }
        else
        {
            Debug.LogError("DialogueManager instance is not found in Dialogue1 scene.");
        }
    }

// swaps the title based on the amount of aura the player has
    public string TitleSwapper(int auraCount){
        if (auraCount < -1000){
            return "Incel";
        } else if (auraCount >= -1000 && auraCount < 0){
            return "Gooner";
        } else if (auraCount == 0){
            return "Nobody";
        } else if (auraCount > 0 && auraCount <= 2000){
            return "Rizzler";
        } else if (auraCount > 2000 && auraCount <= 3000){
            return "Sigma";
        } else if (auraCount > 3000){
            return "Alpha Chad";
        }
        return "Nobody";
    }

// Sets Aura
    public void SetAura(int auraval)
    {
        auraTextValue = auraval;
    }

}
