using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ButtonHelp : MonoBehaviour
{
    public GameObject pauseMenu;

    void Start() {
        pauseMenu.gameObject.SetActive(false);
    }
// functions for buttons in the game
    public void TogglePauseMenu()
    {
        if (pauseMenu != null){
           if (Input.GetKeyUp(KeyCode.Escape))
            {
                if (pauseMenu.activeSelf == false)
                {
                    pauseMenu.gameObject.SetActive(true);
                } else
                {
                    pauseMenu.gameObject.SetActive(false);
                }
            } 
        }
    }
    public void ExitGame()
    {
        // close the game
        Debug.Log("Game Quit");
        Application.Quit();
    }
}
