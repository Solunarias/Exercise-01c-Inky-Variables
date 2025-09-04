/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/



-> lab_room

== lab_room ==
{not (lab_room_search or door): You wake up in a lab,} {lab_room_search: Your in a lab, a fridge and table are present, and of course,} there is a door.
+ {lab_room_search} [search fridge] -> search_fridge
+ {lab_room_search} [go to table] -> table
* [search room] -> lab_room_search
+ [check door] -> door

== lab_room_search ==
in searching the room you find a fridge and a clear box on a table with what apears to be a moving piece of goo in it
* [search fridge] -> search_fridge
* [go to table] -> table
* [stop searching] -> lab_room

== search_fridge ==
you open the fridge finding several packs of what looks to be meat...... you think?
+ [grab some....... meat?] -> meat
+ [close the fridge] -> lab_room

== meat ==
You grab some....... meat?
+ [close the fridge] -> lab_room

== table ==
there is a clear box on the table, the box has a hole, large enough to put your hand in, and in the box is some sort of sentient goo{not key:, and wait....... is that a key?} {key:, it is happily chowing down, at least...... you think thats what its doing}
* {not key} [GRAB IT!!!] -> end_1_cat_nap
* {key} [pet the goo] -> end_2_cat_nap_full
* {meat} [divert the goo with meat? and grab the key] -> key
+ [return] -> lab_room

== key ==
you successfully manage to distract the goo with your questionably sourced meat? and grab the key
+ [return] -> lab_room

== door ==
{not unlocked: its closed}{unlocked: the door is wide open}
* {unlocked} [leave] -> lab_hall
+ {not unlocked} [open door] -> locked
+ [return] -> lab_room

== locked ==
its locked
* {key} [unlock door] -> unlocked
+ [return] -> lab_room

== unlocked ==
the key works! the door is unlocked
* [continue] -> door

== end_1_cat_nap ==
as you attempt to grab the key the goo grabs you, you try to pull away, but the goo quickly spreads across your arm, then your body. pretty soon you grow catlike ears and a tail, becoming an almost bipedal cat like creature. this room feels like home, time for a cat nap :3c -> END

== end_2_cat_nap_full ==
as you pet the goo it grabs you, you try to pull away, but the goo quickly spreads across your arm, then your body. pretty soon you grow catlike ears and a tail, becoming an almost bipedal cat like creature. this room feels like home, and for some reason you feel very full, the taste of some sort of meat lingering in your mouth, time for a cat nap :3c -> END

VAR vial = "none"
VAR relationship = 3

== lab_hall ==
as you enter into the hall, you see a figure which looks animal like in apperance, but that stands on two legs. it seems to be wearing some sort of skull, it unnerves you.
* [stay hidden] -> hidden_hall
* [run] -> end_3_playtime_tag
* [approach cautiously] -> niko

== hidden_hall
you decide to avoid the creature, looking for a way out, you see another door, covered in vines, there is also a table which appears to have many scientific impliments on it
+ [check vined door] -> vined_door
+ [check science table] -> science_table

== vined_door ==
the door is covered in purple vines, they're pretty thick, and you're pretty scrawny (sorry, just being honest) so you're definately not able to bring em down with your bare hands
* {vial_obtained and vial == "purple"} [pour contents of vial] -> good_end_1_escape_alone
* {vial_obtained and vial == "none"} [pour contents of empty vial] -> end_4_fools_gambit
* {vial_obtained and vial != "purple" and vial != "none"} [pour contents of vial] -> end_5_chemical_mishap
+ [return] -> hidden_hall

== niko ==
you approach the creature, it's black fur looks very soft, and its skull mask is oddly cute having a closer look, it seems to be wearing a collar, the tag says Niko, you notice a food chart on the wall, as well as a table with lots of different science equipment on it
* [pet Niko] -> end_6_eternal_pets
* {vial_obtained and vial == "none"} [give Niko the empty vial] -> end_7_playtime_fetch
* {vial_obtained and (vial == "blue" or vial == "yellow")} [give Niko the vial] 
~ relationship = 4
-> niko_end_prelim
* {vial_obtained and (vial == "purple" or vial == "orange")} [give Niko the vial] 
~ relationship = 2
-> niko_end_prelim
* {vial_obtained and vial == "green"} [give Niko the vial] 
~ relationship = 5
-> niko_end_prelim
* {vial_obtained and vial == "black"} [give Niko the vial]  -> niko_end_prelim
* {vial_obtained and vial == "red"} [give Niko the vial] 
~ relationship = 1
-> niko_end_prelim
+ [observe chart] -> chart
+ [check science table] -> science_table

== chart ==
observing the chart it seems that whoever was here before you noted that Niko loves fruit, it has a weak spice tolerance though
+ [interesting] -> niko

== science_table ==
looking at the table there are many colored vials, as well as an empty one, theres also a piece of paper on the table {vial_obtained :your vial currently contains liquid of a {vial} color}
+ [read paper] -> paper
* [grab empty vial] -> vial_obtained
+ {vial_obtained} [add red liquid] -> red
+ {vial_obtained} [add blue liquid] -> blue
+ {vial_obtained} [add yellow liquid] -> yellow
+ {hidden_hall} [return] -> hidden_hall
+ {niko} [return] -> niko

== paper ==
you observe the piece of paper, its pretty boring science stuff, something about weedkillers needing to be the same color or something like that {niko: (this doesn't seem particularly helpful in this situation)}
+ [how curious] -> science_table

== vial_obtained ==
you grab the vial, hopefully you know what you're doing with it, chemistry was never your strongsuit
* [return] -> science_table

== red ==
the red liquid almost smells like cinnamon, it burns your nosehairs a bit
* {vial == "none"} [A spicy start I suppose] 
~ vial = "red" 
-> science_table
* {vial == "blue"} [add some spice to my blueberrys] 
~ vial = "purple"
-> science_table
* {vial == "yellow"} [add some spice to my lemons] 
~ vial = "orange"
-> science_table
* {vial == "green"} [add some spice to my fruits] 
~ vial = "black"
-> science_table
+ [actually, Id prefer not to put cinnamon in this] -> science_table

== blue ==
the blue liquid smells just like blueberry's, its almost nostalgic
* {vial == "none"} [A sweet start I suppose] 
~ vial = "blue"
-> science_table
* {vial == "red"} [add some sweetness to my cinnamon] 
~ vial = "purple"
-> science_table
* {vial == "yellow"} [add some sweetness to my lemons] 
~ vial = "green"
-> science_table
* {vial == "orange"} [add some sweetness to my spiced lemons] 
~ vial = "black"
-> science_table
+ [actually, Id prefer not to put blueberries in this] -> science_table

== yellow ==
the yellow liquid smells a bit like lemons, lemony fresh
* {vial == "none"} [A sour start I suppose] 
~ vial = "yellow"
-> science_table
* {vial == "red"} [add some sourness to my cinnamon] 
~ vial = "orange"
-> science_table
* {vial == "blue"} [add some sourness to my blueberries] 
~ vial = "green"
-> science_table
* {vial == "orange"} [add some sourness to my spiced blueberries] 
~ vial = "black"
-> science_table
+ [actually, Id prefer not to put lemons in this] -> science_table

== niko_end_prelim ==
you hand Niko the vial
* {relationship == 1} [he looks mad] -> end_8_niko_fit
* {relationship == 2} [he seems unamused] -> end_9_niko_annoyed
* {relationship == 3} [.....] -> end_10_niko_death
* {relationship == 4} [it seems like he enjoyed it] -> end_11_niko_happy
* {relationship == 5} [wow, that must have been really good] -> good_end_2_escape_with_niko

== end_3_playtime_tag ==
you attempt to run away, however this proves innefective, the creature presuming you are playing a game with it, chases you down and gives you a hug. it almost seems like you're being absorbed into it's body, and suddenly you realize that you've grown ears and a tail. you suddenly feel very playful, Let's play tag X3 -> END

== end_4_fools_gambit ==
you turn the vial upside down on the vines, doing, nothing...... cause its empty....... the creature looks at you, with a look that almost screams that your stupid. out of embarresment you accidentally crush the vial in your hand, cutting it. when the creature sees this it rushes towards you. out of fear you hold out your hands, only for it to gently lick your wound in an almost caring way. you seem to be absorbed by this feeling, and suddenly you realize that you've grown ears and a tail. you blush hard, leaning into the creature. maybe you'll cuddle..... just for a while -> END

== end_5_chemical_mishap ==
you pour the vial onto the vines, the {vial} liquid hissing but not burning through the vine. something isn't right, but before you can do anything about it, the creature (now aware of your presence thanks to the hissing chemicals) pushes you against the vines. your back hitting the chemical mess you made, you almost seem absorbed by it, and suddenly you realize, you've grown ears, a tail, and some sort of {vial} fur, you have the strange urge to drink more chemicals, luckily, the science table is a treasure trove of them, the creature watching as you throw back vial after vial in some form of disgust -> END

== end_6_eternal_pets ==
you go to pet Niko, his fur is very soft, in fact, its amazingly soft, you can't seem to stop petting him, its like your being absorbed by his fur, if you were paying attention, you would have noticed that you began to grow ears and a tail, but you simply can't stop petting, Niko gets all the pets -> END

== end_7_playtime_fetch ==
you hand Niko the empty vial, he gives it back to you. you toss the vial, he brings it back to you. you and Niko enjoy this game for several hours, your hand getting covered in Niko's saliva, almost like your hand is being absorbed by it. suddenly you realize that you've grown ears and a tail. maybe you and Niko could switch roles in this game of fetch -> END

== end_8_niko_fit ==
you hand Niko the vial of {vial} liquid and Niko drinks it. his face scruches as it flushes, he coughs violently then glares at you with a hatred. quickly he pins you to the ground, biting your neck. the pain is unbearable. you become almost absorbed by it, quickly you realize you've grown ears and a tail, but even worse, you get the unbearable feeling that you've truly dissapointed Niko -> END

== end_9_niko_annoyed ==
you hand Niko the vial of {vial} liquid and Niko drinks it. his face scruches, he doesn't seem to like it, but he doesn't hate it. he leans into you, in a pout. he seems so cute like this, you almost don't want to stop his addorable little rampage, you become absorbed in the moment. suddenly you realize that you've grown ears and a tail, but you don't care that much, you're too obsessed with Niko's cute tantrum to notice -> END

== end_10_niko_death ==
you hand Niko the vial of {vial} liquid and Niko drinks it. he chokes immidiately, collapsing to the floor, his body melting as the liquid burns through his insides. you watch in horror as Niko becomes little more than fur and bones on the floor, his collar laid in the middle of the pile. you fall to your knees, holding what little remains there are as you cry relentlessly, you become absorbed in greif. until you suddenly realize that Niko's body is no longer there, you become confused before looking in a mirror and realize that you have merged with Niko's body. with a shaky hand you put on the collar and continue crying, and oddly for some reason, craving something fruity -> END

== end_11_niko_happy ==
you hand Niko the vial of {vial} liquid and Niko drinks it. his face lights up as he quickly downs the rest. it seems he really enjoyed that. Niko comes over and sits you down, before sitting in your lap. this makes you very happy, and you enjoy his company, so much so that you become absorbed by it. suddenly you realize you've grown ears and a tail, but this doesn't bother you. you just continue to relax with Niko -> END

== good_end_1_escape_alone ==
you pour the vial onto the vines, the {vial} liquid quickly burning through the vines, quietly you open the door and exit the lab, the creature never even knew you were there. as you look out into the world you realize........ it is not the world you once knew, it seems apocolyptic in nature......... this is unfortunate, but hey, you've survived countless horrifying monsters at this point, whats a few more -> END

== good_end_2_escape_with_niko ==
you hand Niko the vial of {vial} liquid and Niko drinks it. his face lights up and he blushes, it seems like its the best thing he's ever had. Niko quickly walks over to a vine covered wall and you realize that there is a door behind it. you ask Niko if he can remove the vines and Niko does so easily. you head outside, Niko following, and you look out to see the world as you realize........ it is not the world you once knew, it seems apocolyptic in nature......... it scares you. Niko notices this and tries to comfort you with a smile. he's right, this may not be the world you once knew, but you have Niko now, and you're gonna get through this together -> END