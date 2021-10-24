if ( keyboard_check_released(ord("P") ) )
{
	var _filename = string(current_day)+"_"+string(current_hour)+"_"+string(current_minute)+"_"+string(current_second)+".png";

	surface_save(application_surface,_filename);
}


//if ( instance_exists(obj_player) )
//{
//	var _x = obj_player.x - (view_width / 2 );
//	var _y = obj_player.y - (view_height / 2);
	
//	var _vx = clamp(_x,0, room_width - view_width );
//	var _vy = clamp(_y,0, room_height - view_height );
//	camera_set_view_pos(VIEW,_vx,_vy);
//}

show_debug_message(room)