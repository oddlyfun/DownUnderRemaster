var _inst = instance_nearest(0,0,o_player_fish);

var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _dist_left = mouse_x - _camx;
var _dist_right = abs(mouse_x - (_camx + view_width));
var _dist_top = abs(mouse_y - (_camy));
var _dist_bottom = abs(mouse_y - (_camy + view_height));

var _vx = _camx;
var _vy = _camy;


if ( _dist_left <= 50 )
{
	if (_camx < -abs(view_width/2) )
	{
		var _temp = room_width + _camx;
		_inst.x = _inst.x + room_width;
		_vx = _temp;
	} else
	{
		_vx = _camx - cam_speed;
	}
}


if ( _dist_right <= 50 )
{
	var _max_right = room_width;
	if (_camx > _max_right )
	{
		var _temp = _camx - room_width;
		_inst.x = _inst.x - room_width;
		_vx = _temp;
	} else
	{
		_vx = _camx + cam_speed;
	}
}


if ( _dist_top <= 50 )
{
	_vy = _camy - cam_speed;
}

if ( _dist_bottom <= 50 )
{
	_vy = _camy + cam_speed;
}



_vy = clamp(_vy,0, room_height - view_height );
camera_set_view_pos(view_camera[0],_vx,_vy);