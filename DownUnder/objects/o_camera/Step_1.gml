var _inst = instance_nearest(0,0,o_fish);

var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[1]);

var _dist_left = mouse_x - _camx;
var _dist_right = abs(mouse_x - (_camx + view_width));

//show_debug_message(_camx);

var _vy = clamp(_camy,0, room_height - view_height );

if ( _dist_left <= 50 )
{

	
	if (_camx < -abs(view_width/2) )
	{
		var _temp = room_width + _camx;
		_inst.x = _inst.x + room_width;
		camera_set_view_pos(view_camera[0],_temp,_vy);
	} else
	{
		camera_set_view_pos(view_camera[0],_camx - cam_speed,_vy);
	}
	
}

if ( _dist_right <= 50 )
{
	var _max_right = room_width;
	if (_camx > _max_right )
	{
		var _temp = _camx - room_width;
		_inst.x = _inst.x - room_width;
		camera_set_view_pos(view_camera[0],_temp,_vy);
	} else
	{
		camera_set_view_pos(view_camera[0],_camx + cam_speed,_vy);
	}
}