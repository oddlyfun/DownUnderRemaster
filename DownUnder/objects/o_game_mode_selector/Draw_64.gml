// Player can open and close the main menu

if ( display_level == 1 and clicked == false )
{
	//spr_popup_X
	//spr_radial_button
	//draw_sprite_stretched(sprite, subimg, x, y, w, h);
	//device_mouse_x_to_gui(device_id)

	//center the x value of the pop up window
	var _window_x = (ui_width / 2) - ( mode_selection_width / 2);
	var _window_y = (ui_height / 2) - ( mode_selection_height / 2);

	draw_sprite_stretched(spr_popup_X, 0, _window_x, _window_y, mode_selection_width, mode_selection_height);

	var _window_title = "Choose a Game Mode";

	draw_set_font(fnt_game);
	draw_set_color(c_white);

	draw_text(_window_x + right_margin, _window_y + top_white_space, _window_title);

	// calculates the x mouse position on the GUI 
	var _disp_width = camera_get_view_width(view_camera[0]);
	var _disp_height = camera_get_view_height(view_camera[0]);

	
	var _gui_mx = floor( ui_width * (mouse_x / _disp_width ) );
	var _gui_my = floor( ui_height * (mouse_y / _disp_height ) );

	//create 4 radial buttons
	var _radial_y = _window_y + 32;
	var _radial_x = _window_x + right_margin;
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
		draw_set_color(c_black);
		draw_text(_radial_x + 32, _radial_y, _button_text);
		_radial_y = _radial_y + 32;
	}
	
	
	
//*************************
//		'X' close Window
//*************************
	var _close_x = _window_x + mode_selection_width - 16;
	var _close_y = _window_y;
	
	draw_set_color(c_red);
	draw_rectangle(_close_x, _close_y, _close_x + 16, _close_y + 16, false);
	
	if ( mouse_check_button_pressed(mb_left) )
	{
		if ( _gui_mx > _close_x and _gui_mx < _close_x + 16 and _gui_my > _close_y and _gui_my < _close_y + 16 )
		{
			display_level = 0;
		}
	}
	
}





// skips the code for a single frame so I don't capture the mouse click on the same frame from the step event
if ( clicked == true )
{
	clicked = false;
}