//Step


if ( show_display == true ) 
{
	my_window.check_close_hover();

	if ( mouse_check_button_released(mb_left) )
	{
		if ( my_window.hover_close == true )
		{
			show_display = false;
			global.PAUSED = false;
		}
	}
}