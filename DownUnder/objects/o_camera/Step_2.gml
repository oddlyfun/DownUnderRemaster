if ( keyboard_check_released(ord("P") ) )
{
	var _filename = string(current_day)+"_"+string(current_hour)+"_"+string(current_minute)+"_"+string(current_second)+".png";

	surface_save(application_surface,_filename);
	show_debug_message(_filename);
}




if ( window_width != window_get_width() or window_height != window_get_height() )
{
	window_width = window_get_width();
	window_height = window_get_height();
	
	show_debug_message( string(window_width) + " x " + string(window_height)  );
	alarm_set(1,1);
	
}



if ( keyboard_check_pressed(vk_up) )
{
	window_set_size(1480,620);
}

if ( keyboard_check_pressed(vk_right) )
{
	if ( window_get_fullscreen() == false )
	{
		window_set_fullscreen(true);
	} else
	{
		window_set_fullscreen(false);
	}
	
}

if ( keyboard_check_pressed(vk_down) )
{
	window_set_size(640,360);
}


if ( keyboard_check_pressed(vk_left) )
{
	var _vw = window_get_width(); //camera_get_view_width(view_camera[0]);
	var _vh = window_get_height(); // camera_get_view_height(view_camera[0]);
	show_debug_message( string(_vw) + " x " + string(_vh) );
	
}



