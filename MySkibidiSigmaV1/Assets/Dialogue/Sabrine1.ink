INCLUDE Stacy1.ink
VAR auracount = 0
VAR playerName = "Y/N"
VAR xp = 0
VAR firstConvo = -> first // in logic cases we need to call a pointer variable for some reason
// VAR secondConvo = -> second
// VAR thirdConvo = -> third

//problem: Ink doesn't store the xp value when it is restarted by Unity, how do we upkeep? do we have to set another script?
{ xp:
- 0: ->firstConvo
// - 100: ->secondConvo
// - 200: ->thirdConvo
    - else: Don't talk to me // you've talked to the character too much / just an error handler
}


=== first ===
//starting with Sabrine
...Hi

 * I could spot that gyaaatt from across the library! Had to say hi. #impact:bad
    ~auracount = auracount - 50 // ouch 
    Oh... um thanks?
    S-sorry that was a little forward, my name is {playerName}
    I'm Sabrine
    * * I don't mean to be weird but uh can I get yo insta? #impact:cringe
        ~auracount = auracount -100 
        uh, no sorry
        // epic fail end of convo
    * * I just wanted to comment on your looksmaxxing, have a good evening m'lady
        Thanks {playerName}
        // a fine save, no more aura lost.
    -> DONE
 * Sorry to bother, are you working on the 3D Game Programming Project? #impact:good
    ~auracount = auracount + 50
    Uh.. yeah! How'd you know?
    Oh, I was also locking in on that not too long ago.
    It's a lot of work, been having trouble keeping that grindset.
    * * On Skibidi this assignment is brutal #impact: good
        ~auracount = auracount + 50
        It's nice to know I'm not alone, what is your game?
        I made a game where you play a day in the life as Andrew Tate. 
        Woah, that's way cooler than mine.
        What did you make?
        Oh, just a dating simulator where Baby Gronk rizzes up Livvy Dunne.
        CRAAAAZY, That sounds so poggers.
        It will be once I get it to work...
        * * * Do you.. want me to stay and help? #impact:great
            Only if you know the best ways to rizz up Livvy Dunne
            My mewing streak is over a year, I'd say I'm quite the rizzler.
            '*giggles*' Okay yeah, I could use a project buddy.
            Based! 
            ~ auracount = auracount +100
        * * * Don't stress, you'll get it eventually
            Yeah.. I hope so, good luck on your project!
            You too! I'll come by later.
    * * Unlucky dude, I've been following this goated tutorial for mine, could send you the link if ya want? #impact:great
        ~auracount = auracount + 100
        A link? Lowkey that may save my life dude thanks!
        Of course! ...anddd I need your email so I can send it.
        Oh uh sure, try smendoza6223@sdsu.edu
        Aaand sent! 
        Awesome!! {playerName}, right?
        Yeah, {playerName}, let me know if you have any questions, struggling is part of the process.
        Sure, thanks!
        
        
    
~xp = xp + 100
- Nice to meet you #speaker:{playerName}
- Bye
// - New Level of Aura: {auracount} #speaker:Narrator
->DONE