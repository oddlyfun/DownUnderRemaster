my_window.check_close_hover();
fs_checkbox.check_hover();

if ( mouse_check_button_released(mb_left) )
{
	if ( my_window.hover_close == true )
	{
		room_goto(ro_start_screen);
	}


	if ( fs_checkbox.checked == true )
	{
		window_set_fullscreen(true);
	} else
	{
		window_set_fullscreen(false);
	}
}
