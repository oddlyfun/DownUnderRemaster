//Step


if ( show_display == true ) 
{
	my_window.check_close_hover();
	play_btn.check_hover();
	exit_btn.check_hover();
	if ( mouse_check_button_released(mb_left) )
	{
		if ( my_window.hover_close == true or play_btn.hover == true )
		{
			show_display = false;
			global.PAUSED = false;
		}


		if ( exit_btn.hover == true )
		{
			global.PAUSED = false;
			room_goto(ro_start_screen);
		}
	}
}
