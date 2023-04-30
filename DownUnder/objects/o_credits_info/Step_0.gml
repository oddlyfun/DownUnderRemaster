credit_window.check_close_hover();
close_btn.check_hover();


if ( mouse_check_button_released(mb_left) )
{
	if ( close_btn.hover == true or credit_window.hover_close == true)
	{
		room_goto(ro_start_screen);
	}
}