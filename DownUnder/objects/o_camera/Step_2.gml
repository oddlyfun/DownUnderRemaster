if ( keyboard_check_released(ord("P") ) )
{
	var _filename = string(current_day)+"_"+string(current_hour)+"_"+string(current_minute)+"_"+string(current_second)+".png";

	surface_save(application_surface,_filename);
	show_debug_message(_filename);
}