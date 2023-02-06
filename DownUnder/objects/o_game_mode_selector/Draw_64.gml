// Player can open and close the main menu

if ( display_level == 1 )
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
	var _gui_mx = floor( ui_width * (mouse_x / display_get_width() ) );
	var _gui_my = floor( ui_height * (mouse_y / display_get_height() ) );

	//create 4 radial buttons
	var _radial_y = _window_y + top_margin + top_white_space;
	var _radial_x = _window_x + right_margin;
	for ( var i = 0; i < number_of_modes; i++ )
	{
		if ( mouse_check_button_pressed(mb_left) )
		{
			if ( _gui_mx > _radial_x and _gui_mx < _radial_x + 32 and _gui_my > _radial_y and _gui_my < _radial_y + 32 )
			{
				// I think I clicked the button ??
				mode_select = i;
			}
		}

		var _image_index = 0;
		var _button_text = mode_text_array[@ i];
		if ( i == mode_select ) then _image_index = 1;

		draw_sprite(spr_radial_button, _image_index, _radial_x, _radial_y);
		draw_text(_radial_x + 32, _radial_y, _button_text);
		_radial_y = _radial_y + 32;
	}
}
