// Player can open and close the main menu

if ( display_level == 1 and clicked == false )
{
	//spr_popup_X
	//spr_radial_button
	//draw_sprite_stretched(sprite, subimg, x, y, w, h);
	//device_mouse_x_to_gui(device_id)
	//center the x value of the pop up window
	//var _window_x = (ui_width / 2) - ( mode_selection_width / 2);
	//var _window_y = (ui_height / 2) - ( mode_selection_height / 2);
	//draw_sprite_stretched(spr_popup_X, 0, _window_x, _window_y, mode_selection_width, mode_selection_height);
	//var _window_title = "Choose a game mode";
	//draw_set_font(global.fnt_spr_small);
	//draw_set_color(c_white);
	//draw_text(_window_x + right_margin, _window_y + top_white_space, _window_title);

	// draws the window using the struct
	mode_window.draw_me();
	var _anchor_points = mode_window.ac_points; // 2d array of (x,y) points

	// calculates the x mouse position on the GUI 
	var _disp_width = camera_get_view_width(view_camera[0]);
	var _disp_height = camera_get_view_height(view_camera[0]);
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	
	var _gui_mx = floor( ui_width * ((mouse_x - _vx) / _disp_width ) );
	var _gui_my = floor( ui_height * ((mouse_y - _vy) / _disp_height ) );

	//radial buttons start point
	var _radial_x = mode_window.x + _anchor_points[@ 0][@ 1].x + right_margin;
	var _radial_y = mode_window.y + _anchor_points[@ 0][@ 1].y;

	
	for ( var i = 0; i < number_of_modes; i++ )
	{
		if ( mouse_check_button_pressed(mb_left) )
		{
			if ( _gui_mx > _radial_x and _gui_mx < _radial_x + 32 and _gui_my > _radial_y and _gui_my < _radial_y + 32 )
			{
				mode_select = i;
			}
		}

		var _image_index = 0;
		var _button_text = mode_text_array[@ i];
		if ( i == mode_select ) then _image_index = 1;

		draw_sprite(spr_radial_button, _image_index, _radial_x, _radial_y);
		//draw_set_color(c_black);
		//draw_text(_radial_x + 32, _radial_y, _button_text);
		write_text(_radial_x + 32, _radial_y, c_black, _button_text);
		_radial_y = _radial_y + 32;
	}
	
//*********************************************************************
//		Radial Selection Game Mode Description
//*********************************************************************

	var _text_display_x = mode_window.x + ( mode_window.width / 2);
	var _text_display_y = mode_window.y + ( mode_window.height * 0.15);
	var _right_bound = mode_window.x + mode_window.width - 36;
	var _the_words = "";
	if ( mode_select != -1 )
	{
		_the_words = mode_text_info[@ mode_select];
	}
	draw_text_wrap(_text_display_x, _text_display_y, 
		_right_bound, mode_selection_height, _the_words);
	
//*************************
//		'X' close Window
//*************************
	//var _close_x = _window_x + mode_selection_width - 16;
	//var _close_y = _window_y;
	
	//draw_set_color(c_red);
	//draw_rectangle(_close_x, _close_y, _close_x + 16, _close_y + 16, false);
	
	//if ( mouse_check_button_pressed(mb_left) )
	//{
		//if ( _gui_mx > _close_x and _gui_mx < _close_x + 16 and _gui_my > _close_y and _gui_my < _close_y + 16 )
		//{
			//display_level = 0;
			//mode_select = -1;
		//}
	//}

//***************************************
//		draw Start // Cancel buttons
//***************************************
	var _quater_width = mode_window.width / 4;
	var _btn_x = (_quater_width - ( cancel_button.width / 2 )) + mode_window.x;
	var _btn_y = (mode_window.y + mode_window.height) - ( mode_window.height * 0.05) - start_button.height;

	cancel_button.gx = _btn_x;
	cancel_button.gy = _btn_y;
	start_button.gx = _btn_x + ( _quater_width * 2 );	
	start_button.gy = _btn_y;

	cancel_button.draw_me();
	start_button.draw_me();
	//var _cb = cancel_button;
	//var _sb = start_button;

	//draw_basic_button(_cb.gx, _cb.gy, _cb.width, _cb.height, _cb.state, _cb.text);
	//draw_basic_button(_sb.gx, _sb.gy, _sb.width, _sb.height, _sb.state, _sb.text);
}


// skips the code for a single frame so I don't capture the mouse click on the same frame from the step event
if ( clicked == true )
{
	clicked = false;
}

/*
if ( was_created == true )
{
	draw_rectangle_color(0,0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	was_created = false;
	display_level = 0;
	//visible = true;
}
*/