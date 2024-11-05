using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Ending : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI dialogueTextObj;
    [SerializeField] private TextMeshProUGUI playerTitle;
    [SerializeField] private TextMeshProUGUI auraText;
    private string dialogueText = "";
    private string previousTitle = "";
    
    
    void Start()
    {
        if (auraText == null)
            auraText = GameObject.Find("AuraText")?.GetComponent<TextMeshProUGUI>();
        if (playerTitle == null)
            playerTitle = GameObject.Find("PlayerTitleText")?.GetComponent<TextMeshProUGUI>();
        if (dialogueTextObj == null)
        {
            Debug.LogError("dialogueTextObj is not found.");
            return;
        }

         if (playerTitle != null) previousTitle = playerTitle.text;
        endingDialogue(previousTitle);
    
    }

    // Update is called once per frame
    void Update()
    {
        if (playerTitle != null && playerTitle.text != previousTitle)
        {
            previousTitle = playerTitle.text;
            endingDialogue(previousTitle);
        }
    }


    void endingDialogue(string title){
        switch(title){
            case "Current Title: Alpha Chad":
                dialogueText = "You got the title: Alpha Chad! This is the highest level title you could have gotten. You have a way with the ladies ;). Play again to get a different result or to have new conversations.";
                break;
            case "Current Title: Sigma":
                dialogueText = "You got the title: Sigma! This is the second highest level title you could have gotten. Your aura seems to be booming. Play again to get a different result or to have new conversations.";
                break;
            case "Current Title: Rizzler":
                dialogueText = "You got the title: Rizzler! This is the third highest level title you could have gotten. You have must some decency I guess, kinda average idk. Play again to get a different result or to have new conversations.";
                break;
            case "Current Title: Nobody":
                dialogueText = "You got the title: Nobody. This is the most mid title you could have gotten. Either you did absolutely nothing, or your mistakes canceled out, either way play again to get a different result or to have new conversations.";
                break;
            case "Current Title: Gooner":
                dialogueText = "You got the title: Gooner! This is the second lowest level title you could have gotten. Ew! You dog. Play again to get a different result or to have new conversations.";
                break;
            case "Current Title: Incel":
                dialogueText = "You got the title: Incel! This is the lowest level title you could have gotten. It takes effort to be this atrocious. Never talk to women. Play again to get a different result or to have new conversations.";
                break;
            default:
                dialogueText = "You finished the game, exit and play again!";
                break;

        }
        dialogueTextObj.text = dialogueText;
    }



}
