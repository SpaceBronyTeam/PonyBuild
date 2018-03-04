/*

Задача: Создать файл со спрайтами одежды для пони,
используя за основу спрайты человеческой одежды

Предпочтительный метод: С помощью verb'a
В потенциале можно использовать это для изменения спрайтов прямо во время игры

*/

/datum/sprite_coordinate
	var/color
	var/base_x
	var/base_y


proc/cloth_trans_H2P(var/icon/I, var/direction)
	var/icon/human_pattern = new('H2P_patterns.dmi', "human", direction)
	var/icon/pony_pattern = new('H2P_patterns.dmi', "pony", direction)
	var/human_coordinates[32][32]
	var/pony_coordinates[32][32]

	//В следующих двух циклах мы преобразуем цвета в попарно связанные координаты
	for(var/x=1, x<=32, x++) for(var/y=1, y<=32, y++)
		var/datum/sprite_coordinate/C = new
		C.color = human_pattern.GetPixel(x, y)
		human_coordinates[x][y] = C


	//Тут сравниваются цвета
	for(var/x=1, x<=32, x++) for(var/y=1, y<=32, y++)
		var/datum/sprite_coordinate/C = new
		C.color = pony_pattern.GetPixel(x, y)
		for(var/i=1, i<=32, i++) for(var/j=1, j<=32, j++)
			var/HC = human_coordinates[i][j]
			if(C.color == HC.color)
				C.base_x = i
				C.base_y = j

	//Тут мы уже переносим цвета на указанные координаты
	var/icon/new_I = new
	for(var/x=1, x<=32, x++) for(var/y=1, y<=32, y++)
		var/PC = human_coordinates[x][y]
		new_I.DrawBox(I.GetPixel(base_x, base_y),x,y)

	return new_I


/mob/verb/SpriteClothingH2P(var/target_icons as icon)
	alert("Новые спрайты будут сохранены в папке SCH2P в корне сборки. ВНИМАНИЕ: Функция не расчитана на анимированные обьекты")
	var/list/states = IconStates(target_icons)

	//Теперь нужно сохранить все старые иконки на всякий случай
	fcopy(target_icons, "SCH2P/old_icons.dmi")

	//Создаем вместилище для преобразованных спрайтов
	var/icon/target_file = new('SCH2P/new_icons.dmi')

	//Тут уже идет обработка каждого спрайта
	for(var/ps in states)
		var/icon/I_south = new(processing_icon, ps, SOUTH)
		var/icon/I_west  = new(processing_icon, ps, WEST)
		var/icon/I_east  = new(processing_icon, ps, EAST)
		var/icon/I_north = new(processing_icon, ps, NORTH)

		//Каждая сторона спрайта преобразовывается
		I_south = cloth_trans_H2P(I_south, SOUTH)
		I_west  = cloth_trans_H2P(I_south, WEST)
		I_east  = cloth_trans_H2P(I_south, EAST)
		I_north = cloth_trans_H2P(I_south, NORTH)

		//Теперь создаем новую иконку для добавления
		var/icon/pony_icon = I_south
		pony_icon += image(I_west, dir=WEST)
		pony_icon += image(I_east, dir=EAST)
		pony_icon += image(I_NORTH, dir=NORTH)

		target_file.Insert(pony_icon, ps)