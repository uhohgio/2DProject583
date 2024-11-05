VAR stacyCount = 0
VAR playerName = "Y/N"
->stacy_intro

=== stacy_intro ===
"...*you approach Stacy, noticing her scrolling through her phone, nails perfectly done, sipping on a boba. She glances up, giving you a quick once-over*." #speaker: Narrator

* "Hey, couldn’t help but notice the drip." #impact:good #speaker:You
    ~stacyCount = stacyCount + 50
    "*She smirks, flicking a strand of her dyed hair over her shoulder.* Oh, you noticed? Yeah, I’m always maxin’ my drip, gotta stay icy. So.. what’s up?"

    * * "Just thought you looked like you had that main-character energy." #impact:good
        ~stacyCount = stacyCount + 50
        "*She laughs, flipping her hair dramatically.* Obviouslyyy. Someone’s gotta be the main character out here, might as well be me."

        * * * "Must take a lot of energy to keep up that slay, huh?" #impact:great
            ~stacyCount = stacyCount + 100
            "*She raises her boba cup as if toasting.* All day, every day, babe. But it’s worth it to keep the haters pressed."

        * * * "It’s working—I’m totally hooked." #impact:great
            ~stacyCount = stacyCount + 100
            "*She bites her lip, giving you a playful wink.* Careful, I might get you too hooked, and then you’ll be in my DMs 24/7."

    * * "I mean, it’s giving ABG. Respect." #impact:neutral
        // ~stacyCount = stacyCount + 10
        "*She laughs, taking a long sip of her boba.* You already know it. I stay reppin’. ABG life chose me."

        * * * "And the lifestyle comes with all that confidence too, huh?" #impact:good
            ~stacyCount = stacyCount + 50
            "Baby, if you’re gonna live it, you gotta own it. Confidence is just part of the package."

        * * * "So what’s your boba order? This looks like some next-level stuff." #impact:great
            ~stacyCount = stacyCount + 50
            "*She holds up her drink proudly.* Honey jasmine green tea, extra sweet, boba and lychee jelly. Goated. You tryna try it or what?"

    * * "No cap, I bet you’re the life of every party." #impact:good
        ~stacyCount = stacyCount + 50
        "*She grins, twirling her straw.* Of course. Gotta bring the heat, you know? Otherwise, what’s the point?"

        * * * "Respect, you’re really about that life." #impact:good
            ~stacyCount = stacyCount + 50
            "*She gives you an approving nod.* Exactly. You don’t half-send, you go full send or you don’t show up at all."
        * * * "So what do you do when you’re not lookin’ so fierce?" #impact:neutral
            "*She gives you a raised eyebrow, as if she’s sizing you up.* Fierce? Babe, this is just my casual look. Wait ‘til you see me on a night out."
        
            * * * *"Casual? You’re a whole mood." #impact:good
                ~stacyCount = stacyCount + 50
                "*She laughs, tossing her hair.* You know it. Gotta keep the energy high-key, even on my days off."
                "So, what’s the going-out fit look like?" #impact:good
                    ~stacyCount = stacyCount + 50
                "*She leans in, her eyes glinting mischievously.* Leather, glitter, and attitude. But that’s all you get to know… for now."
        
            * * * *"Night out sounds wild. Where’s the go-to spot?" #impact:good
                ~stacyCount = stacyCount + 50
                "*She takes another sip of her drink, looking at you like she’s evaluating your worth.* Depends. You got the vibes for my usual spots?"
                "I don’t know, are your spots even ready for my vibes?" #impact:good
                ~stacyCount = stacyCount + 50
                "*She raises an eyebrow, clearly intrigued.* Alright, loser. You got me curious. Maybe I’ll let you find out one day."



* "Is boba your whole personality or…" #impact:bad
    ~stacyCount = stacyCount - 50
    "*She gives you an unimpressed look, taking a long sip of her drink.* Maybe. Or maybe it’s just that boba and I are both iconic, and I only vibe with the real ones."

    * * "Got it, no hate on the boba life. Just making convo." #impact:bad
        ~stacyCount = stacyCount - 50
        "*She raises an eyebrow, clearly unimpressed.* Convo? *pauses* Sure. Let’s call it that."
        "So.. what else do you vibe with? 'sides boba of course."
        "*She sighs, giving you a little smirk.* Honestly? I vibe with late nights, fast cars, and anyone who can keep up, and.. oh look! you didn't make the list."

    * * "Alright, I’ll admit—I’m a little curious about what’s in that cup." #impact:neutral
        "*She rolls her eyes, but she still looks amused.* Typical. *holds up her cup* It’s honey jasmine, extra sweet. And yes, it’s fire."
        * * * "Can I get a sip?" #impact:creep
            ~stacyCount = stacyCount - 200
            // ew what the flip
            "Ugh, as if, I don't know where your crusty ass lips have been."
            "Ain't matter where they've been, just the magic they work."
            "I- bye."
            ->END
        * * * "Honestly more of a Thai Tea guy myself."
            "SOOO basic... but understandable, good ole reliable."
            "I enjoy having a safe drink to fall back to."
            "mhm.."
            // blanddddd!!!

* "So, you into K-dramas or just the look?" #impact:bad
    ~stacyCount = stacyCount - 50
    "*She raises an eyebrow, her tone icy.* Wow… okay, that’s a choice. I mean, yeah, I vibe with the style, but I’m not out here living a K-drama."

    * * "No offense! Just trying to figure out what makes you… you." #impact:neutral
        "*She seems to relax, but her tone’s still distant.* Maybe try asking questions that aren’t assumptions. I’m more than a look."

    * * "All good! I’m just saying you’d be the main character, hands down." #impact:neutral
    ~stacyCount = stacyCount + 10
    "*She raises an eyebrow, studying you with a curious smile.* Main character? You’re really trying to gas me up, huh? Well, you’re not wrong… but this is *my* show, and not everyone can keep up with the energy."

    * * * "Maybe, but I could bring some fire to your storyline. You know, sidekick vibes." #impact:good
        ~stacyCount = stacyCount + 50
        "*She laughs, clearly entertained.* Sidekick? *shakes her head* Babe, you’d have to prove you can handle the spotlight first. My life isn’t for amateurs."

        * * * *"Think I could pass the audition?" #impact:good
            ~stacyCount = stacyCount + 50
            "*She tilts her head, sizing you up, her smirk turning a little more interested.* Audition, huh? Maybe. But you’d have to do more than just talk big, {playerName}. Real main character energy is rare—think you’ve got it?"

            * * * * *"Guess I’ll have to show you then." #impact:great
                ~stacyCount = stacyCount + 100
                "*She raises her boba as if in a toast.* Alright, show me what you’ve got. But if you can’t keep up, don’t blame me if you get left in the dust."


            * * * * *"Tell me what it takes to keep up, and I’ll do it." #impact:good
                ~stacyCount = stacyCount + 50
                "*She leans in, her voice dropping to a more serious tone.* First rule? Confidence. If you don’t have the energy to handle the scene, you’ll just look lost. *Her expression softens slightly* Just… don’t act like you know me. I’m more than what you see."
                "Fair enough. I’d like to get to know more." #impact:great
                ~stacyCount = stacyCount + 100
                "*Her expression relaxes, her smirk returning.* Good answer. Maybe you’re not just here for the boba and the look. Stick around, and I might just let you in on the real Stacy."


    * * *"Maybe I’m saying I want to be part of the drama." #impact:good
        ~stacyCount = stacyCount + 50
        "*She gives you a skeptical look, though there’s amusement in her eyes.* Oh, really? Most people try to avoid drama, but you’re out here volunteering for it? *smirks* Bold. But don’t come crying to me if you get in too deep."

        * * * *"Hey, I’ve got nothing to hide, so bring it on." #impact:great
            ~stacyCount = stacyCount + 50
            "*She raises an eyebrow, nodding approvingly.* Alright, I respect that energy. Just know, with me, it’s a wild ride. If you’re ready for that, maybe I’ll give you a little taste of my world."

        * * * *"I mean, I don’t mind a little chaos here and there." #impact:good
            ~stacyCount = stacyCount + 25
            "*She laughs, raising her boba cup.* Then you and I are gonna get along fine, {playerName}. Just remember—chaos is my specialty."

    * * *"I can already tell, your life would make one wild reality show." #impact:good
        ~stacyCount = stacyCount + 50
        "*She grins, clearly entertained.* Oh, babe, you have no idea. Between late nights, tea that spills faster than my boba, and way too many selfies… yeah, you’d be tuning in every episode."

        * * * * "Well, maybe I want the VIP backstage pass." #impact:good
            ~stacyCount = stacyCount + 50
            "*She tilts her head, feigning suspicion.* Hm, trying to get close to the star of the show? I don’t just hand out VIP passes, but… maybe I’ll make an exception if you’re interesting enough."

            * * * * *"What do I need to do to get in?" #impact:great
                ~stacyCount = stacyCount + 75
                "*She gives you an intense look, clearly weighing your sincerity.* For starters, don’t waste my time. I’ve got no patience for people who aren’t real. If you’re upfront, I’ll let you in on all the good, the bad, and the chaotic."

                * * * * * *"Sounds like a deal to me." #impact:great
                    ~stacyCount = stacyCount + 100
                    "*She laughs, taking another long sip of her boba.* Alright, {playerName}. Guess we’ll see if you can keep up with the main character after all."


            * * * * * "I’ll just have to surprise you, then." #impact:good
                ~stacyCount = stacyCount + 50
                "*She smirks, clearly intrigued.* Surprises? I’m here for it. Keep it interesting, and I’ll see if you’ve got that main character spark after all."




- Bye loser. #speaker:Trixie
-> END