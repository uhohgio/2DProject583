using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MainCharacter : MonoBehaviour
{
    public float speed = 2.0f;
    private Vector2 dir;
    private float leftBound = -7.0f;
    private float rightBound = 7.0f;
    private float topBound = 13.0f;
    private float bottomBound = 5.0f;


    [Header("Initialize Girls")]
    public GameObject girl1;
    [SerializeField] private TextAsset SabrineDialogue1;
    private string SabrineScene = "Dialogue1";
    public GameObject girl2;
    [SerializeField] private TextAsset StacyDialogue1;
    private string StacyScene = "Dialogue2";
    public GameObject girl3;
    [SerializeField] private TextAsset TrixieDialogue1;
    private string TrixieScene = "Dialogue3";

    // leaving the game (treated like a girl at least for now)
    [Header("The End")]
    public GameObject doors;
    [SerializeField] private TextAsset EndDialogue1;
    private string EndScene = "EndScene";


    public GameObject PressEText;
    public GameObject LeavePrompt;
    public GameObject gameManagerObject;
    private GameManager gameManagerScript;


    // Start is called before the first frame update
    void Start()
    {
        gameManagerScript = GameObject.Find("GameManager").GetComponent<GameManager>();
    }

    // Update is called once per frame
    void Update()
    {
        // moving the player using WASD
        Rigidbody2D rb = GetComponent<Rigidbody2D>();
        float moveHorizontal = Input.GetAxis ("Horizontal");
        float moveVertical = Input.GetAxis ("Vertical");

        rb.velocity = new Vector2 (moveHorizontal*speed, moveVertical*speed);

        // bounds the player to the scene
        if(rb.position.x <= leftBound){
            rb.velocity = new Vector2 (1*speed, moveVertical*speed);
        }
        if(rb.position.x >= rightBound){
            rb.velocity = new Vector2 ((-1)*speed, moveVertical*speed);
        }
        if(rb.position.y <= bottomBound){
            rb.velocity = new Vector2 (moveHorizontal*speed, 1*speed);
        }
        if(rb.position.y >= topBound){
            rb.velocity = new Vector2 (moveHorizontal*speed, (-1)*speed);
        }

        if (((Mathf.Abs(transform.position.x - girl1.transform.position.x) <= 1)
        && (Mathf.Abs(transform.position.y - girl1.transform.position.y) <= 1)) ||
        ((Mathf.Abs(transform.position.x - girl2.transform.position.x) <= 1)
        && (Mathf.Abs(transform.position.y - girl2.transform.position.y) <= 1)) ||
        ((Mathf.Abs(transform.position.x - girl3.transform.position.x) <= 1)
        && (Mathf.Abs(transform.position.y - girl3.transform.position.y) <= 1))
        ) {
                // prompt interactable
                PressEText.SetActive(true);
            } else {
                PressEText.SetActive(false);
            }
        // Girl 1 : Sabrine
        TalkToGirls(girl1, SabrineDialogue1, SabrineScene);

        // Girl 2 : Stacy
        TalkToGirls(girl2, StacyDialogue1, StacyScene);

        // Girl 3 : Trixie
        TalkToGirls(girl3, TrixieDialogue1, TrixieScene);

        // Leave Library

        if ((Mathf.Abs(transform.position.x - doors.transform.position.x) <= 1)
        && (Mathf.Abs(transform.position.y - doors.transform.position.y) <= 1)) {
                // prompt interactable
                LeavePrompt.SetActive(true);
            } else {
                LeavePrompt.SetActive(false);
            }

        TalkToGirls(doors, EndDialogue1, EndScene);
    }

    // toggles interactions with the NPC's
    void TalkToGirls(GameObject chosenGirl, TextAsset chosenDialogue, string chosenScene)
    {
            
        if ((Mathf.Abs(transform.position.x - chosenGirl.transform.position.x) <= 1)
            && (Mathf.Abs(transform.position.y - chosenGirl.transform.position.y) <= 1)
            && Input.GetKeyDown(KeyCode.E)) {
                // trigger interaction
                Debug.Log("You said Hi to this girl!");
                GameManager.GetInstance().currentDialogue = chosenDialogue;
                GameManager.GetInstance().currentDialogueScene = chosenScene;
                GameManager.GetInstance().dialogueCalled = true;
            }
    }

// loading a scene 
    private static IEnumerator LoadLevel (string sceneName){
        var asyncLoadLevel = SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Single);
        while (!asyncLoadLevel.isDone){
            Debug.Log("Loading the Scene"); 
            yield return null;
        }
    }


}
