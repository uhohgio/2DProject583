VAR auracount = 0
VAR playerName = "Y/N"
VAR xp = 0
->firstEncounter
=== firstEncounter ===
// first interaction with Trixie
"...Ah, I could sense you approaching. How... quaint."

    
* "I can’t remember the last time I saw someone with style this dark and captivating." #impact:good
    ~auracount = auracount + 50
    "*A soft, amused smile flickers across her face as she studies you, as if trying to gauge your sincerity.* Dark and captivating… you choose your words carefully, don’t you? Most people just call it ‘strange’ and move on. They don’t even try to understand."

    * * "Well, it suits you. You wear it with purpose, not just as a fashion statement." #impact:good
        ~auracount = auracount + 50
        "*Her eyes flash with intrigue as she tilts her head, seeming genuinely surprised.* You’re observant. Yes, it’s more than a look. Everything I wear has meaning—a reminder, a memory, a lesson… like my own personal armor, you could say."
        "Each piece has a story behind it?"
        "*Her fingers brush lightly over one of her rings, a faint, almost wistful smile crossing her face.* Yes. Every ring, every piece of blackened silver, every faded fabric… they’re like scars. Some are painful, some nostalgic, but all of them are reminders I can’t let go."
        "It sounds like they’ve been through a lot with you. They're like.. old friends." #impact:great
            ~auracount = auracount + 100
        "*She chuckles softly, her gaze turning distant.* Friends… or shadows, maybe. They’re comforting in their own way, always close by to remind me of what I’ve been through. Of who I am."
        * * *"I think it’s rare to have something that’s truly personal like that." #impact:good
                    ~auracount = auracount + 50
                    "Not many people would see it that way. Most find comfort in hiding. But I wear my past openly—both the light and the shadows."
        * * *"Memories have a strange power. Sometimes, they’re all we have to guide us." #impact:great
            ~auracount = auracount + 100
            "*Nods thoughtfully, her expression more vulnerable now.* They can be anchors, for better or worse. A reminder of what to cherish… or what to avoid. It’s a kind of honesty not everyone can handle."

    * *"You really went all-out on the goth vibe. Respect." #impact:bad
        ~auracount = auracount - 50
        "*She raises an eyebrow, her expression turning a little cold.* Goth vibe? *pauses* I suppose… it’s just ‘a vibe’ to most people."

        * * *"I mean, it’s cool! Not my style, but I dig it." #impact:cringe
            ~auracount = auracount - 100
            "*She frowns slightly, looking less impressed by the moment.* Yeah… I’m not exactly wearing this for approval. I’m used to people not ‘getting it,’ so don’t worry about it."

            * * * * "Sorry, didn’t mean to be rude. It’s just… interesting, I guess." #impact:neutral
                // ~auracount = auracount + 10
                "*She softens slightly, though still guarded.* Interesting… *pauses* Well, I suppose not everyone has to understand it. I just prefer things with a bit of depth."
                -> DONE

            * * * * "Anyway, what kind of music do you listen to? I bet it’s super emo." #impact:creep
                ~auracount = auracount - 200
                "*She narrows her eyes at you, lips pressing into a thin line.* ‘Emo,’ huh? *shakes her head, clearly unimpressed* Look, I don’t think we have a lot in common. Thanks for the chat, but I have… things to do."
                // immediate end to conversation cuz wtf
                -> END
        * * *"If it makes you feel comfortable, then I guess that’s what matters, right?" #impact:neutral
        ~auracount = auracount - 25
        "*She crosses her arms, looking mildly annoyed.* Comfortable? That’s… not quite the point. *pauses, her tone flat* It’s not about comfort. It’s about facing the parts of myself that most people would rather ignore."

        * * * "Got it… you’re trying to stay true to who you are." #impact:good
            ~auracount = auracount + 25
            "*She studies you for a moment, seemingly surprised by your recovery.* Yes, something like that. It’s about honesty, not just ‘comfort.’"

        * * * "But wouldn’t it be easier to, I don’t know, fit in a little more?" #impact:bad
            ~auracount = auracount - 75
            "*Her eyes narrow, her posture shifting defensively.* Easier, sure. But I’d lose myself in the process. If that’s what it takes to be accepted… well, I’d rather be alone."

        * * * *"Hey, I didn’t mean to offend you. Just curious." #impact:neutral
            "*She sighs, her expression softening slightly, though she still seems distant.* It’s fine. Just… if you’re going to ask about things like this, don’t make it sound like a choice between comfort and conformity. It’s more complicated than that."

                -> DONE

        * * * "Got it… you’re trying to stay true to who you are." #impact:good
            ~auracount = auracount + 50
            "*She studies you for a moment, seemingly surprised by your recovery.* Yes, something like that. It’s about honesty, not just ‘comfort.’"

            * * * *"But wouldn’t it be easier to, I don’t know, fit in a little more?" #impact:cringe
                ~auracount = auracount - 100
                "*Her eyes narrow, her posture shifting defensively.* Easier, sure. But I’d lose myself in the process. If that’s what it takes to be accepted… well, I’d rather be alone."
            * * * *"Hey, I didn’t mean to offend you. Just curious." #impact:neutral
                "*She sighs, her expression softening slightly, though she still seems distant.* It’s fine. Just… if you’re going to ask about things like this, don’t make it sound like a choice between comfort and conformity. It’s more complicated than that."
                    -> DONE

    * * "People probably think it’s just an edgy look, but it’s cool that you commit to it." #impact:bad
        ~auracount = auracount - 50
        "*Her expression hardens a little, like she’s bracing herself.* Commit to it… as if it’s a costume I put on for attention. But no, this isn’t about looking ‘edgy’ or ‘cool.’ It’s… personal."

        * * *"Sorry, I didn’t mean it like that. I just think it’s different." #impact:neutral
            "*She sighs, still visibly unimpressed.* ‘Different.’ People always say that. *mutters* Maybe it’s just that they’re too afraid to be themselves."

        * * *"I get it. I mean, people see things in black and white, right?" #impact:neutral
            "*She seems to soften, though she still seems a little defensive.* Maybe… It’s easier to judge what you don’t understand. But that doesn’t mean it doesn’t sting sometimes."
            "I respect that you’re unapologetically yourself." #impact:good
            ~auracount = auracount + 50
            "*Nods thoughtfully, clearly more receptive now.* Thanks. It’s… rare for someone to get that. Most just make assumptions, and leave it at that."




* "Sorry if this sounds odd, but you look like someone who appreciates the… obscure." #impact:cringe
    ~auracount = auracount - 100
    "It is unwise to speak of that which you do not know. The dark is vastness to which very few know the extents."
    * * You could say that is what gives the dark its charms. #impact:great
    // omg turn it around? rizz 100
        ~auracount = auracount + 100
        "Then perhaps we have something in common. The best secrets are whispered in the dark."
        * * * If you’re willing, I’d love to bring some light to the subject. #impact:great
            // AH 
            ~auracount = auracount + 100
            "Are you certain you’re ready for that? Some secrets cling to the soul like ash. But perhaps... I’ll share a fragment with you."
        * * * Crossing my darkness with yours, we'd have an unstoppable charisma. #impact: bad
            "I have no interest in the sorts of domination, the world is a delicate balance and it is up to us to pay respect to that"
            // strong bond branch
    * * The way you talk about it is interesting. Got any dark tales to tell? #impact:neutral
        // ~auracount = auracount + 50
        "Only the ones that end in sorrow, but... I don’t imagine you mind those?"
    
        * * *"I don’t mind. Sometimes, sorrow is the only thing that feels real." #impact:good
            ~auracount = auracount + 50
            "Ah, a kindred spirit, perhaps. There’s something beautifully haunting in a soul willing to embrace darkness."
            
            * * * * "So, are you going to tell me one of these tales?" #impact:great
                ~auracount = auracount + 50
                "Very well. There was once a girl who wore rings like these... each a promise, each a memory. She vowed never to remove them, for fear her past would fade."
                * * * * * "What happened to her?" #impact:good
                ~auracount = auracount + 50
                    "The weight grew too much. One by one, she let each memory slip away... until she lost herself to the shadows."
                * * * * *"So... the rings keep her connected to who she was?" #impact:good
                    "Perhaps, or perhaps they’re just shackles she forged herself. A reminder that even beauty can turn to ruin."
                * * * * *"Are you talking about yourself?" #impact:neutral
                    // ~auracount = auracount + 100
                    "...Would that change your impression of me if I was?"
                    * * * * * *"No. I think I’d understand you more." #impact:good
                        ~auracount = auracount + 50
                        "*smirks* Then maybe there’s hope for you yet, {playerName}."
                    * * * * * *"Not at all. I’d be... honored to learn more." #impact:great
                        ~auracount = auracount + 100
                        "Careful. Honor doesn’t mix well with the shadows. But perhaps I’ll share a little more… someday."

        * * * "I’m not sure I’d have the patience for stories like that." #impact:bad
        ~auracount = auracount - 50
        "Patience isn’t for everyone, I suppose. A pity... shadows have much to teach."
        //convo ends on this branch

        * * *"Actually, I prefer happy endings. I get enough sorrow in real life." #impact:neutral
        "Happy endings... I suppose they have their place, though I find them more hollow than comforting."
            * * * *"Why hollow?" #impact:neutral
                // ~auracount = auracount + 25
                // bro is so boring pick something good
                "Because true happiness is fleeting, a mirage in the desert. Only sorrow endures."
            * * * *"Maybe I’ll tell you a happy story one day. Just to prove you wrong." #impact:good
                // cheeky ;)
                ~auracount = auracount + 50
                "Then I shall look forward to it, though I don’t think you’ll succeed in swaying me."


* "Cool rings—you seem like someone who knows how to pick out pieces with meaning." #impact:neutral
    ~auracount = auracount + 10
    "*smirks slightly* Few notice these. I don’t wear them for the world; they’re... personal."

    * *"Personal? Like, they remind you of something?" #impact:neutral
        ~auracount = auracount + 10
        "Something, yes. Or... someone. But perhaps that's more than you bargained for, {playerName}."
        "I mean, I’m curious now. You’ve got my attention." #impact:good
            ~auracount = auracount + 50
        "*raises an eyebrow* Not many are interested in listening to shadows. But alright… I’ll humor you a little."

        "You talk like your rings hold some kind of story. Am I wrong?"
        "*smirks* Perhaps you’re more observant than I expected. Yes, each one does hold a story—a memory. I don't wear them lightly."
        "So, they’re like… pieces of your past?" 
        "You could say that. I carry them as reminders, though some memories are less kind than others."
        "Must be hard, keeping those memories with you."
        "Hard? Perhaps. But I don’t see them as burdens. More like… scars I’ve chosen to wear."
            * * *"Do you think... scars can make us stronger?" #impact:great
            ~auracount = auracount + 100
            "*smiles faintly* Ah, now you’re asking the right questions. Yes, I believe they can. But strength and pain are often bound together."
            "Then I think you’re stronger than you give yourself credit for." #impact:perfect
            "Hmph.. flattery won’t get you anywhere... though I appreciate the sentiment. Perhaps... I’ll share one of these stories with you someday."
            * * *Do you think scars just weigh us down? #impact:neutral
                "Perhaps they do. But I’d rather be weighed down by truth than live in the emptiness of forgetting."

    * *"Did someone give you those rings, or did you pick them out yourself?" #impact:neutral
        "Some were gifts, some were choices I made myself. All have... significance."

        * * *"It’s cool that they’re important to you. They suit you." #impact:good
            ~auracount = auracount + 50
            "Hm. I’ve never been one for compliments, but I’ll accept that one."

        * * *"That sounds... heavy, like there’s a lot of meaning there." #impact:neutral
            // ~auracount = auracount + 50
            "Heavy... that’s a word for it. The things we choose to carry are rarely light. Each ring is a chapter—some dark, some darker."
            "It must take strength to keep them on." #impact:good
                ~auracount = auracount + 50
            "Strength, or stubbornness. Sometimes, I wonder if it’s the latter."
            "What do you mean by that?" 
            "Holding onto memories can be both a blessing and a curse. But they’re all that remain of those... moments."
            * * * *"I get that. Some memories are worth holding onto, no matter the cost." #impact:great
                ~auracount = auracount + 50
                "*looks at you thoughtfully* You surprise me, {playerName}. Not many would understand. Yes, even painful memories deserve their place."
            * * * *"Sounds like those memories mean a lot to you." #impact:good
                        ~auracount = auracount + 50
                        "More than I care to admit, if I’m honest."

        * * *"So… each one is a reminder of something?" #impact:neutral
            "*nods slowly* Yes. A reminder, a memory… and perhaps a warning. Each carries its own story."

            * * * *"I’d like to hear one of those stories someday." #impact:good
                ~auracount = auracount + 50
                "...Perhaps. But only if you’re willing to see the shadows for what they are. Not everyone wants that."

                * * * * *"I think I can handle it." #impact:bad
                    ~auracount = auracount - 50
                    "*smiles in disbelief* We’ll see. Shadows have a way of sticking to those who seek them out."
                * * * * *"The shadows tend to know who to reveal themselves to." #impact:good
                    ~auracount = auracount + 50
                    "They do, don't they?"    
                    // deeper connection established


-> trixieFarewell
    ~xp = xp + 100
- "See you in the shadows... if fate allows." #speaker:Trixie
->DONE

=== trixieFarewell ===
"...Farewell. Trust in where the night may lead you." #speaker:Trixie
->DONE