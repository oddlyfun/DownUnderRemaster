
if ( mouse_check_button_pressed(mb_left) )
{

	var _check = gui_element_collision(
		toggle_struct.gx, 
		toggle_struct.gy,
		toggle_struct.width,
		toggle_struct.height
		);
		
		
	if ( _check == true )
	{
		if ( scroll_bar_toggle == false )
		{
			scroll_bar_toggle = true;
		} else
		{
			scroll_bar_toggle = false;
			sb_bulb_scroll_amount = 0;
		}
	}
	
}


if ( mouse_check_button(mb_left) )
{
	var _check = gui_element_collision(
		sb_bulb_struct.gx, 
		sb_bulb_struct.gy,
		sb_bulb_struct.width,
		sb_bulb_struct.height
		);
		
	if ( _check == true )
	{
		sb_bulb_scroll_amount = sb_bulb_scroll_amount + (mouse_y - prev_mouse_y);
		
	}
}



prev_mouse_y = mouse_y;