proc/create_new_xenomorph(var/alien_caste,var/target)

	target = get_turf(target)
	if(!target || !alien_caste) return

	var/mob/living/carbon/pony/new_alien = new(target)
	new_alien.set_species("Changeling [alien_caste]")
	return new_alien

/mob/living/carbon/pony/xdrone/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, "Changeling Drone")

/mob/living/carbon/pony/xsentinel/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, "Changeling Sentinel")

/mob/living/carbon/pony/xhunter/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, "Changeling Infiltrator")

/mob/living/carbon/pony/xqueen/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, "Changeling Queen")

// I feel like we should generalize/condense down all the various icon-rendering antag procs.
/*----------------------------------------
Proc: AddInfectionImages()
Des: Gives the client of the alien an image on each infected mob.
----------------------------------------*/
/mob/living/carbon/pony/proc/AddInfectionImages()
	if (client)
		for (var/mob/living/C in mob_list)
			if(C.status_flags & XENO_HOST)
				var/obj/item/alien_embryo/A = locate() in C
				var/I = image('icons/mob/alien.dmi', loc = C, icon_state = "infected[A.stage]")
				client.images += I
	return

/*----------------------------------------
Proc: RemoveInfectionImages()
Des: Removes all infected images from the alien.
----------------------------------------*/
/mob/living/carbon/pony/proc/RemoveInfectionImages()
	if (client)
		for(var/image/I in client.images)
			if(dd_hasprefix_case(I.icon_state, "infected"))
				del(I)
	return


/mob/living/carbon/pony/var/changeling_timer = 0
/mob/living/carbon/pony/var/adult_form
/mob/living/carbon/pony/var/prestatus = "pony"

/obj/structure/changeling_cocoon
	icon = 'icons/obj/changeling_cocoons.dmi'
	var/html_interface
	var/list/interface_users = list()

	transform
		name = "transformation cocoon"
		icon_state = "transform_empty_new"
		density = 1
		anchored = 1.0
		var/list/allowed_races = list("Earthpony", "Unicorn", "Pegasus")
		var/timer = 100
		var/transform_mode = "Changeling Infiltrator"
		var/health = 100

		attackby(obj/item/weapon/W as obj, mob/user as mob)
			if(istype(W, /obj/item/weapon/grab))
				var/obj/item/weapon/grab/G = W
				MouseDrop_T(G.affecting, user)

		MouseDrop_T(atom/movable/O as mob|obj, mob/user as mob)
			if(istype(O, /mob/living/carbon/pony) && O:species.name in allowed_races)
				if(!contents.len)
					step_towards(O, loc)
					if(user != O)
						user.show_viewers("<span class='danger'>[user] stuffs [O] into [src]!</span>")
					add_fingerprint(user)
					if(istype(O, /mob/living/carbon/pony) && O:species.name in allowed_races)
						contents += O//Повтор условия сделан потому, что при некоторых обстоятельствах в кокон может попасть не жертва
						spawn()
							StartTimerTransform(O)
				return

		proc/StartTimerTransform(var/mob/living/carbon/pony/P)
			icon_state = "transform_inactive"
			for()
				if(!src || !contents.len || health < 50)
					if(src && contents.len)
						ReleaseCocoon()
					break

				sleep(rand(30, 200))
				if(timer)
					P.changeling_timer++
					timer--

				if(prob(P.changeling_timer))
					P << local(sanitize_simple("<b>[pick( \
					30;"Вы чувствуете странный холод в груди.", \
					30;"Вам кажется, что ваша кожа уплотняется и твердеет.",\
					30;"Внезапно, вы почувствовали прилив сил.",\
					10;"Неожиданно, вам кажется, что вы испытываете симпатию к другим чейнжлингам.", \
					30;"Боль пронзает Вашу голову и не дает вам сосредоточиться.",\
					30;"Вы осознаете, что с вашим разумом происходит что-то странное.",\
					30;"Вы слышите тихий шепот, но не можете его разобрать.",\
					30;"Вы ощущаете нарастающий зуд в районе лба.",\
					10;"Внезапно для себя Вы находите, что черный и зеленый - весьма красивые цвета.",\
					100;"Ваше тело пронзает судорога.",\
					100;"Ваши копыта пронзает легкая судорога.")]</b>"))

					//"Королева - твой друг" Подобные сообщения только при взрослении
					//"Поклоняйся королеве"
					//Так же в будущем нужно добавить шанс временных галлюцинаций

				if(P.changeling_timer>=100)
					//transform pony
					switch(transform_mode)
						if("Random")
							P.change_mob_type( /mob/living/carbon/pony , null, null, 1, "Changeling Hatchling")
							P.adult_form = pick(100;"Changeling Drone", 100;"Changeling Infiltrator", 10;"Changeling Sentinel", 1;"Changeling Princess")
						else
							P.change_mob_type( /mob/living/carbon/pony , null, null, 1, "Changeling Hatchling")
							P.adult_form = transform_mode//= "Evolution""Evolution Advance"
					ReleaseCocoon()
					break

		proc/ReleaseCocoon()
			var/mob/living/carbon/pony/P = pick(contents)
			P.loc = loc
			//Если нет особой модификации, то кокон превращается в мусор
			icon_state = "transform_empty"
			//if(

		//Интерфейс кокона, вербы и все остальное через клик. Не нужно заморачиваться с контекстным меню

	dispenser
		icon_state = "dispenser_empty_new"
	egg
		icon_state = "egg_0"


	attack_hand(mob/user as mob)
		add_fingerprint(user)
		show_interface(user)
		view() << "<b>[user] touched [src]</b>"



	proc/show_interface(var/mob/living/carbon/pony/user)
		if("Changeling" in user.species.name)

			if(!(user in interface_users))
				interface_users += user
			for(var/mob/M in interface_users)
				M << html_interface




/mob/living/carbon/pony
	New()
		..()
		if(species.name == "Changeling Hatchling")
			spawn(0)
				StartHatchlingGrowing()

	proc/StartHatchlingGrowing()
		while(changeling_timer < 100)
			sleep(rand(100, 200))
			changeling_timer++
		switch(adult_form)
			if("Evolution")
				var/new_form = alert(local(sanitize_simple("Greetings, you're now adult changeling. Please, choose your role before starting of your adult life.")), "Changeling Drone", "Changeling Infiltrator")
				src.change_mob_type( /mob/living/carbon/pony , null, null, 1, new_form)
			else
				src.change_mob_type( /mob/living/carbon/pony , null, null, 1, adult_form)






/* TODO: Convert this over.
/mob/living/carbon/pony/alien/show_inv(mob/user as mob)

	user.set_machine(src)
	var/dat = {"
	<B><HR><FONT size=3>[name]</FONT></B>
	<BR><HR>
	<BR><B>Left Hand:</B> <A href='?src=\ref[src];item=l_hand'>[(l_hand ? text("[]", l_hand) : "Nothing")]</A>
	<BR><B>Right Hand:</B> <A href='?src=\ref[src];item=r_hand'>[(r_hand ? text("[]", r_hand) : "Nothing")]</A>
	<BR><B>Head:</B> <A href='?src=\ref[src];item=head'>[(head ? text("[]", head) : "Nothing")]</A>
	<BR><B>(Exo)Suit:</B> <A href='?src=\ref[src];item=suit'>[(wear_suit ? text("[]", wear_suit) : "Nothing")]</A>
	<BR><A href='?src=\ref[src];item=pockets'>Empty Pouches</A>
	<BR><A href='?src=\ref[user];mach_close=mob[name]'>Close</A>
	<BR>"}
	user << browse(dat, text("window=mob[name];size=340x480"))
	onclose(user, "mob[name]")
	return
	*/

/* TODO: Convert this over.
/mob/living/carbon/pony/alien/queen/large
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "queen_s"
	pixel_x = -16

/mob/living/carbon/pony/alien/queen/large/update_icons()
	lying_prev = lying	//so we don't update overlays for lying/standing unless our stance changes again
	update_hud()		//TODO: remove the need for this to be here
	overlays.Cut()
	if(lying)
		if(resting)					icon_state = "queen_sleep"
		else						icon_state = "queen_l"
		for(var/image/I in overlays_lying)
			overlays += I
	else
		icon_state = "queen_s"
		for(var/image/I in overlays_standing)
			overlays += I*/