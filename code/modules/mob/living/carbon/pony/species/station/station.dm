/datum/species/pony
	name = "Earthpony"
	name_plural = "Earthpony"
	language = "Sol Common"
	primitive = /mob/living/carbon/monkey
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Some of the many original inhabitants of Equestria are earth ponies. Let them not have magic or wings, \
they more than compensate for their ingenuity and diligence. Most of the farms somehow belong to the earth pony, \
on which they also work. Also often a little stronger than other ponies."
	blurb_ru = "Одни из многих исконных жителей Эквестрии - земные пони. Пусть они не владеют магией или крыльями, \
	они с лихвой компенсируют их изобретательностью и трудолюбием. Большая часть ферм так или иначе принадлежит земным пони,\
	на коих они же и работают. Также зачастую несколько сильнее других пони."

	flags = CAN_JOIN | HAS_SKIN_COLOR | HAS_LIPS | HAS_EYE_COLOR | HAS_CUTIEMARK
	brute_mod = 0.9
	reagent_tag = IS_HERBIVORE



/datum/species/unicorn
	name = "Unicorn"
	name_plural = "Unicorn"
	icobase = 'icons/mob/pony_races/r_unicorn.dmi'
	deform = 'icons/mob/pony_races/r_def_unicorn.dmi'
	language = "Sol Common"//"Sinta'unicorn"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)///datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	primitive = /mob/living/carbon/monkey/unicorn
	//darksight = 3
	//gluttonous = 1

	blurb = "Pony with a horn - or unicorns - a race of ponies that originated in the mountains, who learned to handle magic. \
At one time they even controlled the course of day and night in Equestria. Possessing the ability to magic, \
Unicorns actively use it in their life, whoever he is - a tailor, a mechanic or even an ordinary handyman. \
A skilled mage can be a very dangerous opponent."
	blurb_ru = "Пони с рогом - или же единороги - зародившиеся в горах раса пони, научившиеся обращаться с магией. \
	В свое время они даже управляли ходом дня и ночи в Эквестрии. Обладая способностью к магии, \
	единороги активно используют её в своей жизни, кем бы он не был - портным, механиком или даже обычным разнорабочим. \
	Умелый маг может быть очень опасным противником."

	//cold_level_1 = 280 //Default 260 - Lower is better
	//cold_level_2 = 220 //Default 200
	//cold_level_3 = 130 //Default 120
	//heat_level_1 = 420 //Default 360 - Higher is better
	//heat_level_2 = 480 //Default 400
	//heat_level_3 = 1100 //Default 1000

	flags = CAN_JOIN | HAS_LIPS | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_CUTIEMARK

	//flesh_color = "#34AF10"

	//reagent_tag = IS_UNICORN
	//base_color = "#011000"

	//heat_discomfort_level = 295
	//heat_discomfort_strings = list(
	//	"You feel soothingly warm.",
	//	"You feel the heat sink into your bones.",
	//	"You feel warm enough to take a nap."
	//	)
	//cold_discomfort_level = 292
	//cold_discomfort_strings = list(
	//	"You feel chilly.",
	//	"You feel sluggish and cold.",
	//	"Your scales bristle against the cold."
	//	)
	reagent_tag = IS_HERBIVORE
	has_external_organ = list(
		/datum/organ/external/chest 	= list("main",  "skin", "gender" ),

		/datum/organ/external/neck 		= list("chest", "skin", "!gender"),
		/datum/organ/external/head 		= list("neck",  "skin", "gender" ),
		/datum/organ/external/r_ear		= list("head",  "skin", "!gender"),
		/datum/organ/external/l_ear		= list("head",  "skin", "!gender"),
		/datum/organ/external/horn 		= list("head",  "skin", "!gender"),

		/datum/organ/external/groin 	= list("chest", "skin", "gender" ),
		/datum/organ/external/tail 		= list("groin", "skin", "!gender"),
		/datum/organ/external/r_backleg 	= list("groin", "skin", "!gender"),
		/datum/organ/external/r_backhoof 	= list("r_backleg", "skin", "!gender"),
		/datum/organ/external/l_backleg		= list("groin", "skin", "!gender"),
		/datum/organ/external/l_backhoof 	= list("l_backleg", "skin", "!gender"),

		/datum/organ/external/l_foreleg 	= list("chest", "skin", "!gender"),
		/datum/organ/external/l_forehoof 	= list("r_foreleg", "skin", "!gender"),

		/datum/organ/external/r_foreleg 	= list("chest", "skin", "!gender"),
		/datum/organ/external/r_forehoof 	= list("r_foreleg", "skin", "!gender")
	)

/datum/species/pegasus
	name = "Pegasus"
	name_plural = "Pegasus"
	icobase = 'icons/mob/pony_races/r_pegasus.dmi'
	deform = 'icons/mob/pony_races/r_def_pegasus.dmi'
	language = "Sol Common"//Siik'tajr"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	//unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	//darksight = 8
	slowdown = -1
	brute_mod = 1.2
	burn_mod = 1.2

	blurb = "The Pegasus race is a species of feline-like bipeds hailing from the planet of Ahdomai in the \
	S'randarr system. They have been brought up into the space age by the ponys and Alicorn, and have been \
	influenced heavily by their long history of Slavemaster rule. They have a structured, clan-influenced way \
	of family and politics. They prefer colder environments, and speak a variety of languages, mostly Siik'Maas, \
	using unique inflections their mouths form."
	blurb_ru = "Пегасы - жители облаков и неба. Они обладают врожденной способностью к полетам и управлению погодой.\
	Вторая способность очень помогает земным пони в земледелии. \
	Так же пегасы прославились своим милитаристичным прошлым, от чего считаются лучшими воинами."

	//cold_level_1 = 200 //Default 260
	//cold_level_2 = 140 //Default 200
	//cold_level_3 = 80 //Default 120

	//heat_level_1 = 330 //Default 360
	//heat_level_2 = 380 //Default 400
	//heat_level_3 = 800 //Default 1000

	primitive = /mob/living/carbon/monkey/pegasus

	flags = CAN_JOIN | HAS_LIPS | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_CUTIEMARK

	//flesh_color = "#AFA59E"
	//base_color = "#333333"

	//heat_discomfort_level = 292
	//heat_discomfort_strings = list(
	//	"Your fur prickles in the heat.",
	//	"You feel uncomfortably warm.",
	//	"Your overheated skin itches."
	//	)
	//cold_discomfort_level = 275
	reagent_tag = IS_HERBIVORE
	has_external_organ = list(
		/datum/organ/external/chest 	= list("main",  "skin", "gender"),

		/datum/organ/external/neck 		= list("chest", "skin", "!gender"),
		/datum/organ/external/head 		= list("neck",  "skin", "gender"),
		/datum/organ/external/r_ear		= list("head",  "skin", "!gender"),
		/datum/organ/external/l_ear		= list("head",  "skin", "!gender"),

		/datum/organ/external/groin 	= list("chest", "skin", "gender"),
		/datum/organ/external/tail 		= list("groin", "skin", "!gender"),
		/datum/organ/external/r_backleg 	= list("groin", "skin", "!gender"),
		/datum/organ/external/r_backhoof 	= list("r_backleg", "skin", "!gender"),
		/datum/organ/external/l_backleg		= list("groin", "skin", "!gender"),
		/datum/organ/external/l_backhoof 	= list("l_backleg", "skin", "!gender"),

		/datum/organ/external/r_wing 	= list("chest", "skin", "!gender"),
		/datum/organ/external/l_wing 	= list("chest", "skin", "!gender"),

		/datum/organ/external/l_foreleg 	= list("chest", "skin", "!gender"),
		/datum/organ/external/l_forehoof 	= list("r_foreleg", "skin", "!gender"),

		/datum/organ/external/r_foreleg 	= list("chest", "skin", "!gender"),
		/datum/organ/external/r_forehoof 	= list("r_foreleg", "skin", "!gender"),
	)

/datum/species/alicorn
	name = "Alicorn"
	name_plural = "Alicorn"
	icobase = 'icons/mob/pony_races/r_alicorn.dmi'
	deform = 'icons/mob/pony_races/r_def_alicorn.dmi'
	//eyes = "alicorn_eyes_s"
	language = "Sol Common"
	primitive = /mob/living/carbon/monkey/alicorn
	unarmed_types = list(/datum/unarmed_attack/punch)
	blurb = "A very rare combination of circumstances and genes allows to be born a completely unique kind of pony - alicorn. \
From birth, they have all the capabilities of Pegasus, as well as horn and abilities to magic many times \
superior abilities of the ordinary unicorn. And they do not age. For this reason, Celestia tries to keep \
young alicorns alongside to give them proper upbringing and teach them to handle their power. \
ATTENTION: This race is incredibly rare. And-you-know-who-are-they. \
Are you sure you want to play for them?"
	blurb_ru = "Очень редкое стечение обстоятельств и генов позволяет родиться совершенно уникальному виду пони - аликорну. \
	От рождения они обладают всеми возможностями пегасов, а также рогом и способностями к магии во много раз \
	превосходящие способности рядового единорога. А ещё они не стареют. По этой причине, Селестия старается держать \
	молодых аликорнов рядом, чтобы дать им правильное воспитание и научить их обращаться со своей мощью.\
ВНИМАНИЕ: Эта раса - невероятно редкая. Во всем мире их единицы. И-вы-сами-знаете-кто-они. \
Вы точно уверены что хотите сыграть за них?"

	flags = CAN_JOIN | IS_WHITELISTED | HAS_LIPS | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_CUTIEMARK

	//flesh_color = "#8CD7A3"
	//blood_color = "#1D2CBF"
	//base_color = "#006666"

	reagent_tag = IS_HERBIVORE
	has_external_organ = list(
		/datum/organ/external/chest 	= list("main",  "skin", "gender"),

		/datum/organ/external/neck 		= list("chest", "skin", "!gender"),
		/datum/organ/external/head 		= list("neck",  "skin", "gender"),
		/datum/organ/external/r_ear		= list("head",  "skin", "!gender"),
		/datum/organ/external/l_ear		= list("head",  "skin", "!gender"),
		/datum/organ/external/horn 		= list("head",  "skin", "!gender"),

		/datum/organ/external/groin 	= list("chest", "skin", "gender"),
		/datum/organ/external/tail 		= list("groin", "skin", "!gender"),
		/datum/organ/external/r_backleg 	= list("groin", "skin", "!gender"),
		/datum/organ/external/r_backhoof 	= list("r_backleg", "skin", "!gender"),
		/datum/organ/external/l_backleg		= list("groin", "skin", "!gender"),
		/datum/organ/external/l_backhoof 	= list("l_backleg", "skin", "!gender"),

		/datum/organ/external/r_wing 	= list("chest", "skin", "!gender"),
		/datum/organ/external/l_wing 	= list("chest", "skin", "!gender"),

		/datum/organ/external/l_foreleg 	= list("chest", "skin", "!gender"),
		/datum/organ/external/l_forehoof 	= list("r_foreleg", "skin", "!gender"),

		/datum/organ/external/r_foreleg 	= list("chest", "skin", "!gender"),
		/datum/organ/external/r_forehoof 	= list("r_foreleg", "skin", "!gender")
	)

/datum/species/diona
	name = "Diona"
	name_plural = "Dionaea"
	icobase = 'icons/mob/pony_races/r_diona.dmi'
	deform = 'icons/mob/pony_races/r_def_plant.dmi'
	language = "Rootspeak"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/diona)
	primitive = /mob/living/carbon/alien/diona
	slowdown = 7
	rarity_value = 3
	hud_type = /datum/hud_data/diona
	siemens_coefficient = 0.3

	blurb = "Commonly referred to (erroneously) as 'plant people', the Dionaea are a strange space-dwelling collective \
	species hailing from Epsilon Ursae Minoris. Each 'diona' is a cluster of numerous cat-sized organisms called nymphs; \
	there is no effective upper limit to the number that can fuse in gestalt, and reports exist	of the Epsilon Ursae \
	Minoris primary being ringed with a cloud of singing space-station-sized entities.<br/><br/>The Dionaea coexist peacefully with \
	all known species, especially the Alicorn. Their communal mind makes them slow to react, and they have difficulty understanding \
	even the simplest concepts of other minds. Their alien physiology allows them survive happily off a diet of nothing but light, \
	water and other radiation."

	has_organ = list(
		"nutrient channel" =   /datum/organ/internal/diona/nutrients,
		"neural strata" =      /datum/organ/internal/diona/strata,
		"response node" =      /datum/organ/internal/diona/node,
		"gas bladder" =        /datum/organ/internal/diona/bladder,
		"polyp segment" =      /datum/organ/internal/diona/polyp,
		"anchoring ligament" = /datum/organ/internal/diona/ligament
		)

	warning_low_pressure = 50
	hazard_low_pressure = 1

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 2000
	heat_level_2 = 3000
	heat_level_3 = 4000

	body_temperature = T0C + 15		//make the plant people have a bit lower body temperature, why not

	flags = CAN_JOIN | IS_WHITELISTED | NO_BREATHE | NO_SCAN | IS_PLANT | NO_BLOOD | NO_PAIN | NO_SLIP | HAS_EYE_COLOR

	blood_color = "#004400"
	flesh_color = "#907E4A"

	reagent_tag = IS_DIONA
	eyebrows = null

/datum/species/diona/can_understand(var/mob/other)
	var/mob/living/carbon/alien/diona/D = other
	if(istype(D))
		return 1
	return 0

/datum/species/diona/handle_post_spawn(var/mob/living/carbon/pony/H)
	H.gender = NEUTER
	return ..()

/datum/species/diona/handle_death(var/mob/living/carbon/pony/H)

	var/mob/living/carbon/alien/diona/S = new(get_turf(H))

	if(H.mind)
		H.mind.transfer_to(S)

	for(var/mob/living/carbon/alien/diona/D in H.contents)
		if(D.client)
			D.loc = H.loc
		else
			del(D)

	H.visible_message("\red[H] splits apart with a wet slithering noise!")

/datum/species/machine
	name = "Machine"
	name_plural = "machines"

	icobase = 'icons/mob/pony_races/r_machine.dmi'
	deform = 'icons/mob/pony_races/r_machine.dmi'
	language = "Tradeband"
	unarmed_types = list(/datum/unarmed_attack/punch)
	rarity_value = 2

	eyes = "blank_eyes"
	brute_mod = 0.5
	burn_mod = 1

	warning_low_pressure = 50
	hazard_low_pressure = 0

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 500		//gives them about 25 seconds in space before taking damage
	heat_level_2 = 1000
	heat_level_3 = 2000

	synth_temp_gain = 10 //this should cause IPCs to stabilize at ~80 C in a 20 C environment.

	flags = CAN_JOIN | IS_WHITELISTED | NO_BREATHE | NO_SCAN | NO_BLOOD | NO_PAIN | IS_SYNTHETIC

	blood_color = "#1F181F"
	flesh_color = "#575757"

	has_organ = list() //TODO: Positronic brain.
	eyebrows = null

/datum/species/machine/handle_death(var/mob/living/carbon/pony/H)
	..()
	if(flags & IS_SYNTHETIC)
		H.h_style = ""
		spawn(100)
			if(H) H.update_hair()


/datum/species/griffon
	name = "Griffon"
	name_plural = "Griffon"
	icobase = 'icons/mob/pony_races/r_griffon.dmi'
	deform = 'icons/mob/pony_races/r_def_griffon.dmi'
	language = "Sol Common"//Siik'tajr"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	//unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	//darksight = 8
	slowdown = -1
	brute_mod = 1.2
	burn_mod = 1.2

	blurb = "Pegasus are inhabitants of clouds and sky. They have an innate ability to fly and control the weather. \
The second ability greatly helps the earthponies in agriculture. \
Pegasus also became famous for their militaristic past, from which they are considered the best warriors."
	blurb_ru = "Пегасы - жители облаков и неба. Они обладают врожденной способностью к полетам и управлению погодой.\
	Вторая способность очень помогает земным пони в земледелии. \
	Так же пегасы прославились своим милитаристичным прошлым, от чего считаются лучшими воинами."

	//cold_level_1 = 200 //Default 260
	//cold_level_2 = 140 //Default 200
	//cold_level_3 = 80 //Default 120

	//heat_level_1 = 330 //Default 360
	//heat_level_2 = 380 //Default 400
	//heat_level_3 = 800 //Default 1000

	primitive = /mob/living/carbon/monkey/griffon

	flags = CAN_JOIN | HAS_LIPS | HAS_SKIN_COLOR | HAS_EYE_COLOR

	//flesh_color = "#AFA59E"
	//base_color = "#333333"

	//heat_discomfort_level = 292
	//heat_discomfort_strings = list(
	//	"Your fur prickles in the heat.",
	//	"You feel uncomfortably warm.",
	//	"Your overheated skin itches."
	//	)
	//cold_discomfort_level = 275
	has_external_organ = list(
		/datum/organ/external/chest 	= list("main",  "skin head", "gender" ),

		/datum/organ/external/neck 		= list("chest", "skin head", "!gender"),
		/datum/organ/external/head 		= list("neck",  "skin head", "gender" ),
		/datum/organ/external/beak		= list("head",	"skin beak", "!gender"),

		/datum/organ/external/groin 	= list("chest", "skin", 	 "gender" ),
		/datum/organ/external/tail 		= list("groin", "skin", 	 "!gender"),
		/datum/organ/external/r_backleg 	= list("groin", "skin", 	 "!gender"),
		/datum/organ/external/r_backhoof 	= list("r_backleg", "skin", 	 "!gender"),
		/datum/organ/external/l_backleg		= list("groin", "skin", 	 "!gender"),
		/datum/organ/external/l_backhoof 	= list("l_backleg", "skin", 	 "!gender"),

		/datum/organ/external/r_wing 	= list("chest", "skin", 	 "!gender"),
		/datum/organ/external/l_wing 	= list("chest", "skin", 	 "!gender"),

		/datum/organ/external/l_foreleg 	= list("chest", "skin",		 "!gender"),
		/datum/organ/external/l_forehoof 	= list("r_foreleg", "skin claw", "!gender"),

		/datum/organ/external/r_foreleg 	= list("chest", "skin", 	 "!gender"),
		/datum/organ/external/r_forehoof 	= list("r_foreleg", "skin claw", "!gender")
	)

	eyes = "griffon_eyes_s"
	eyebrows = "griffon"