//*********************************************************************
//
//			Button check for hovers and such
//
//*********************************************************************

for ( var i = 0; i < array_length(btn_array); i++)
{
	var _btn = btn_array[@ i];
	_btn.hover = false;
	_btn.state = 0;
	var _hover_chk = gui_element_collision(_btn.gx, _btn.gy, _btn.width, _btn.height);
	if ( _hover_chk == true )
	{
		_btn.hover = true;
	}
}

window_display.check_close_hover();

//*********************************************************************
//
//						Mouse Checks
//
//*********************************************************************

drop_fishy.toggle_click_check();
drop_fishy.bulb_click_checks();
drop_fishy.move_bulb(mouse_y - prev_mouse_y);

if ( mouse_check_button_pressed(mb_left) )
{

	if ( window_display.hover_close == true )
	{
		instance_create_layer(0,0,"Instances",o_game_mode_selector);
		instance_destroy(id);
	}

}

// held down mouse button
if ( mouse_check_button(mb_left) )
{

	for ( var i = 0; i < array_length(btn_array); i++)
	{
		var _b = btn_array[@ i];
		if ( _b.hover == true ) then _b.state = 1;
	}
}

if ( mouse_check_button_released(mb_left) )
{
	//sb_bulb_active = false;

	for ( var i = 0; i < array_length(btn_array); i++)
	{
		var _b = btn_array[@ i];
		if ( _b.hover == true )
		{
			if ( i == 0 )
			{
				instance_destroy(id);
				instance_create_layer(0,0,"Instances",o_game_mode_selector);
			}
			if ( i == 1 )
			{
				global.LOAD_GAME_LIST = fishy_list;
				global.player_fish_id = fishy_list[@ drop_fishy.selected_index].fish_id;
				global.TIME_OF_DAY = fishy_list[@ drop_fishy.selected_index].active;
				global.player_score = 0;
				save_my_game();
				room_goto(ro_game);
			}
		}
	}
}

prev_mouse_y = mouse_y;
