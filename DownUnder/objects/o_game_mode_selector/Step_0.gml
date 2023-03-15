if ( mouse_check_button_released(mb_left) )
{
	// show the display
	var _cam = view_camera[0];
	var _vw = camera_get_view_width(_cam);
	var _vh = camera_get_view_height(_cam);
	var _ww = _vw * 0.75;
	var _wh = _vh * 0.70;
	
	var _vx = (_vw / 2) - (_ww / 2);
	var _vy = (_vh / 2) - (_wh / 2);
	
	var _rec_point = point_in_rectangle(mouse_x,mouse_y, _vx, _vy, _vx + _ww, _vy + _wh);
	if ( display_level == 0 and _rec_point == true)
	{
		display_level = 1;
		clicked = true;
	}

}

//*********************************************************************
//
//			Display Level 1: Game Mode Selection
//
//*********************************************************************

if ( display_level == 1 and clicked == false )
{

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

	mode_window.check_close_hover();


	// Held down
	if ( mouse_check_button(mb_left) )
	{
		for ( var i = 0; i < array_length(btn_array); i++)
		{
			var _b = btn_array[@ i];
			if ( _b.hover == true ) then _b.state = 1;
		}
	}

	// actually clicked
	if ( mouse_check_button_released(mb_left) )
	{
		for ( var i = 0; i < array_length(btn_array); i++)
		{
			var _b = btn_array[@ i];
			if ( _b.hover == true )
			{
				if (i == 0) then display_level = 0;
				// Start Button
				if (i == 1)
				{
					switch ( mode_select )
					{
						case 0: // Challenge
							global.GAME_MODE = CHALLENGE;
							instance_create_layer(0,0,"Instances",o_mode_ui);
							instance_destroy(id);
						break;
						case 1: // Gauntlet
							global.GAME_MODE = GAUNTLET;
							instance_create_layer(0,0,"Instances",o_mode_ui);
							instance_destroy(id);
						break;
						case 2: // Create-a-Fish
							global.GAME_MODE = CREATE_A_FISH;
							instance_create_layer(0,0,"Instances",o_create_a_fish);
							instance_destroy(id);
						break;
						case 3: // practice
							global.GAME_MODE = PRACTICE;
							instance_create_layer(0,0,"Instances",o_mode_ui);
							instance_destroy(id);
						break;
					}
				}
			}
		}

		// clicking the X button
		if ( mode_window.hover_close == true )
		{
			display_level = 0;
			mode_select = -1;
		}
	}

}
