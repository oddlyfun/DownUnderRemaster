

if ( keyboard_check_pressed(vk_right) )
{
	
	var _x = camera_get_view_x( global.Cameras[1] );
	
	view_xport[1] = view_xport[1] + 1;
	view_xport[0] = view_xport[0] - 1;
//	camera_set_view_pos(view_camera[1] , camera_get_view_x(view_camera[1]), camera_get_view_y(view_camera[1]) );
}