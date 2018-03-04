/datum/game_mode
	var/list/datum/mind/infiltration_changelings = list()
	var/list/allowed_species = list("Earthpony", "Unicorn", "Pegasus")


/datum/game_mode/changeling_infiltration
	name = "changeling infiltration"
	config_tag = "changeling_infiltration"
	restricted_jobs = list("AI", "Cyborg")
	protected_jobs = list("Research Director", "Warden", "Chief Engineer", "Chief Medical Officer", "Head of Security", "Captain")
	required_players = 1
	required_players_secret = 1
	required_enemies = 1
	recommended_enemies = 4

	var/const/prob_int_murder_target = 50 // intercept names the assassination target half the time
	var/const/prob_right_murder_target_l = 25 // lower bound on probability of naming right assassination target
	var/const/prob_right_murder_target_h = 50 // upper bound on probability of naimg the right assassination target

	var/const/prob_int_item = 50 // intercept names the theft target half the time
	var/const/prob_right_item_l = 25 // lower bound on probability of naming right theft target
	var/const/prob_right_item_h = 50 // upper bound on probability of naming the right theft target

	var/const/prob_int_sab_target = 50 // intercept names the sabotage target half the time
	var/const/prob_right_sab_target_l = 25 // lower bound on probability of naming right sabotage target
	var/const/prob_right_sab_target_h = 50 // upper bound on probability of naming right sabotage target

	var/const/prob_right_killer_l = 25 //lower bound on probability of naming the right operative
	var/const/prob_right_killer_h = 50 //upper bound on probability of naming the right operative
	var/const/prob_right_objective_l = 25 //lower bound on probability of determining the objective correctly
	var/const/prob_right_objective_h = 50 //upper bound on probability of determining the objective correctly

	var/const/waittime_l = 600 //lower bound on time before intercept arrives (in tenths of seconds)
	var/const/waittime_h = 1800 //upper bound on time before intercept arrives (in tenths of seconds)

	var/changeling_amount = 4

/datum/game_mode/changeling_infiltration/announce()
	world << "<B>[local(sanitize_simple("The current game mode is - Changeling Infiltration!"))]</B>"
	world << "<B>[local(sanitize_simple("There are alien changelings on the station. Do not let the changelings succeed!"))]</B>"

/datum/game_mode/changeling_infiltration/pre_setup()

	if(config.protect_roles_from_antagonist)
		restricted_jobs += protected_jobs

	var/list/datum/mind/possible_changelings = get_players_for_role(BE_CHANGELING_INFILTRATOR)

	for(var/datum/mind/player in possible_changelings)
		for(var/job in restricted_jobs)//Removing robots from the list
			if(player.assigned_role == job)
				possible_changelings -= player

	changeling_amount = 1 + round(num_players() / 5)

	if(possible_changelings.len>0)
		for(var/i = 0, i < min(changeling_amount, possible_changelings.len), i++)
			var/datum/mind/changeling = pick(possible_changelings)
			possible_changelings -= changeling
			infiltration_changelings += changeling
			modePlayer += changelings
		return 1
	else
		return 0

/datum/game_mode/changeling_infiltration/post_setup()
	var/switch_mode = pick("crew", "out")
	for(var/datum/mind/changeling in infiltration_changelings)
		grant_changeling_infiltration_powers(changeling.current)//Превращает игрока в нужного моба
		//if(switch_mode == "crew") Для альтернативного начала. Если out, то старт где то в джунглях без образа
		//	changeling.current.
		changeling.special_role = "Changeling Infiltrator"
		if(!config.objectives_disabled)//Если цели включены, то...
			forge_changeling_objectives(changeling) // Выдаются задания
		greet_changeling(changeling) // После этого пишется приветствие отдельному чейнжлингу


	spawn (rand(waittime_l, waittime_h))
		send_intercept() //Отправка сообщения о режиме на главный мостик через рандомное время один раз
	..()
	return


/datum/game_mode/proc/forge_changeling_infiltration_objectives(var/datum/mind/changeling)
	//OBJECTIVES - Always absorb 5 genomes, plus random traitor objectives.
	//If they have two objectives as well as absorb, they must survive rather than escape
	//No escape alone because changelings aren't suited for it and it'd probably just lead to rampant robusting
	//If it seems like they'd be able to do it in play, add a 10% chance to have to escape alone

	if (config.objectives_disabled)
		return

	var/datum/objective/absorb/absorb_objective = new
	absorb_objective.owner = changeling
	absorb_objective.gen_amount_goal(2, 3)
	changeling.objectives += absorb_objective

	var/datum/objective/assassinate/kill_objective = new
	kill_objective.owner = changeling
	kill_objective.find_target()
	changeling.objectives += kill_objective

	var/datum/objective/steal/steal_objective = new
	steal_objective.owner = changeling
	steal_objective.find_target()
	changeling.objectives += steal_objective


	switch(rand(1,100))
		if(1 to 80)
			if (!(locate(/datum/objective/escape) in changeling.objectives))
				var/datum/objective/escape/escape_objective = new
				escape_objective.owner = changeling
				changeling.objectives += escape_objective
		else
			if (!(locate(/datum/objective/survive) in changeling.objectives))
				var/datum/objective/survive/survive_objective = new
				survive_objective.owner = changeling
				changeling.objectives += survive_objective
	return

/datum/game_mode/proc/greet_changeling_infiltrator(var/datum/mind/changeling, var/you_are=1)
	if (you_are)
		changeling.current << "<B>\red You are a changeling!</B>"
	changeling.current << "<b>\red Use say \":g message\" to communicate with your fellow changelings. Remember: you get all of their absorbed DNA if you absorb them.</b>"

	show_objectives(changeling)

	if (changeling.current.mind)
		if (changeling.current.mind.assigned_role == "Clown")
			changeling.current << "You have evolved beyond your clownish nature, allowing you to wield weapons without harming yourself."
			changeling.current.mutations.Remove(CLUMSY)


/*/datum/game_mode/changeling/check_finished()
	var/changelings_alive = 0
	for(var/datum/mind/changeling in changelings)
		if(!istype(changeling.current,/mob/living/carbon))
			continue
		if(changeling.current.stat==2)
			continue
		changelings_alive++

	if (changelings_alive)
		changelingdeath = 0
		return ..()
	else
		if (!changelingdeath)
			changelingdeathtime = world.time
			changelingdeath = 1
		if(world.time-changelingdeathtime > TIME_TO_GET_REVIVED)
			return 1
		else
			return ..()
	return 0*/

/datum/game_mode/proc/grant_changeling_infiltration_powers(mob/living/carbon/changeling_mob)
	if(!istype(changeling_mob))	return
	changeling_mob.make_changeling("Infiltrator", infiltration_changelings)

/datum/game_mode/proc/auto_declare_completion_changeling_infiltration()
	if(changelings.len)
		var/text = "<FONT size = 2><B>The changelings were:</B></FONT>"
		for(var/datum/mind/changeling in changelings)
			var/changelingwin = changeling.current
			text += print_player_full(changeling)

			//Removed sanity if(changeling) because we -want- a runtime to inform us that the changelings list is incorrect and needs to be fixed.
			text += "<br><b>Changeling ID:</b> [changeling.changeling.changelingID]."
			text += "<br><b>Genomes Absorbed:</b> [changeling.changeling.absorbedcount]"
			if(!config.objectives_disabled)
				if(changeling.objectives.len)
					var/count = 1
					for(var/datum/objective/objective in changeling.objectives)
						if(objective.check_completion())
							text += "<br><B>Objective #[count]</B>: [objective.explanation_text] <font color='green'><B>Success!</B></font>"
							feedback_add_details("changeling_objective","[objective.type]|SUCCESS")
						else
							text += "<br><B>Objective #[count]</B>: [objective.explanation_text] <font color='red'>Fail.</font>"
							feedback_add_details("changeling_objective","[objective.type]|FAIL")
							changelingwin = 0
						count++
				if(!config.objectives_disabled)
					if(changelingwin)
						text += "<br><font color='green'><B>The changeling was successful!</B></font>"
						feedback_add_details("changeling_success","SUCCESS")
					else
						text += "<br><font color='red'><B>The changeling has failed.</B></font>"
						feedback_add_details("changeling_success","FAIL")
		text += "<br>"

		world << text


	return 1

/datum/changeling_shape
	var/dna
	var/species

	New(var/a, var/b)
		dna = a
		species = b

/datum/changeling //stores changeling powers, changeling recharge thingie, changeling absorbed DNA and changeling ID (for changeling hivemind)
	var/list/absorbed_dna = list()
	var/list/absorbed_species = list("Earthpony", "Unicorn", "Pegasus")
	var/list/absorbed_languages = list()
	var/base_species
	var/base_dna
	var/absorbedcount = 0
	var/chem_charges = 20
	var/chem_recharge_rate = 0.5
	var/chem_storage = 50
	var/sting_range = 1
	var/changelingID = "Changeling"
	var/geneticdamage = 0
	var/isabsorbing = 0
	var/geneticpoints = 5
	var/purchasedpowers = list()
	var/mimicing = ""

/datum/changeling/New(var/gender=FEMALE)
	..()
	var/honorific
	if(gender == FEMALE)	honorific = "Ms."
	else					honorific = "Mr."
	if(possible_changeling_IDs.len)
		changelingID = pick(possible_changeling_IDs)
		possible_changeling_IDs -= changelingID
		changelingID = "[honorific] [changelingID]"
	else
		changelingID = "[honorific] [rand(1,999)]"

/datum/changeling/proc/regenerate()
	chem_charges = min(max(0, chem_charges+chem_recharge_rate), chem_storage)
	geneticdamage = max(0, geneticdamage-1)


/datum/changeling/proc/GetDNA(var/dna_owner)
	var/datum/dna/chosen_dna
	for(var/datum/dna/DNA in absorbed_dna)
		if(dna_owner == DNA.real_name)
			chosen_dna = DNA
			break
	return chosen_dna