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

if ( mouse_check_button_pressed(mb_left) )
{

	var _check_toggle = gui_element_collision(
		toggle_struct.gx, 
		toggle_struct.gy,
		toggle_struct.width,
		toggle_struct.height
		);
	var _check_sb = gui_element_collision(
		sb_bulb_struct.gx, 
		sb_bulb_struct.gy,
		sb_bulb_struct.width,
		sb_bulb_struct.height
		);
//	var _check_x_close = gui_element_collision(
//		window_x + window_width - window_sprite_info.right,
//		window_y,
//		window_sprite_info.right,
//		window_sprite_info.top
//		);
		
		
	if ( _check_toggle == true )
	{
		if ( scroll_bar_toggle == false )
		{
			scroll_bar_toggle = true;
		} else
		{
			scroll_bar_toggle = false;
			sb_bulb_active = false;
			sb_bulb_scroll_amount = 0;
		}
	}

	if ( _check_sb == true ) then sb_bulb_active = true;

	if ( window_display.hover_close == true )
	{
		instance_create_layer(0,0,"Instances",o_game_mode_selector);
		instance_destroy(id);
	}

}

// held down mouse button
if ( mouse_check_button(mb_left) )
{
	var _check = gui_element_collision(
		sb_bulb_struct.gx, 
		sb_bulb_struct.gy,
		sb_bulb_struct.width,
		sb_bulb_struct.height
		);
		
	if ( _check == true or sb_bulb_active == true )
	{
		sb_bulb_scroll_amount = sb_bulb_scroll_amount + (mouse_y - prev_mouse_y);
	}

	//Buttons
	for ( var i = 0; i < array_length(btn_array); i++)
	{
		var _b = btn_array[@ i];
		if ( _b.hover == true ) then _b.state = 1;
	}
}

if ( mouse_check_button_released(mb_left) )
{
	sb_bulb_active = false;

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
				save_my_game();
				//room_goto()
			}
		}
	}
}



prev_mouse_y = mouse_y;
