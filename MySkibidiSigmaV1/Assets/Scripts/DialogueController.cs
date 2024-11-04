using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueController : MonoBehaviour
{

    // int auraCount = 0;
    string characterTitle;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {


        
    }

    void moveDialogue(){
        // if player presses space & if no choice is prompted, skip to next dialogue line
        // if choice is prompted click choice to move to next dialogue line
    }

    string TitleSwapper(int auraCount){
        if (auraCount < 1000){
            return "Incel";
        } else if (auraCount >= 1000 && auraCount < 0){
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

    void script(){
        
    }


}
