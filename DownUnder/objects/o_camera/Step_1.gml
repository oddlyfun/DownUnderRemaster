if ( global.PAUSED == true ) then exit;

var _inst = instance_nearest(0,0,o_cam_help);
var _player = instance_nearest(0,0,o_player_fish);

var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _center_x = _camx + (view_width / 2 );
var _center_y = _camy + (view_height / 2 );

var _vx = _camx;
var _vy = _camy;

var _moving = false;

var _diff_x = 0;
var _diff_y = 0;

if ( instance_exists(_player) ) 
{
	// right side of the center
	var _xpad_pos = _center_x + pad_x;
	if ( _inst.x >= _xpad_pos ) 
	{
		_diff_x = _inst.x - _xpad_pos; 
		_vx = _vx + cam_vel; 
		_moving = true;
	}

	// Left side of the center
	_xpad_pos = _center_x - pad_x;
	if ( _inst.x <= _xpad_pos ) 
	{
		_diff_x = _xpad_pos - _inst.x; 
		_vx = _vx - cam_vel; 
		_moving = true;
	}

	var _ypad_pos = _center_y + pad_y;
	if ( _inst.y >= _ypad_pos ) 
	{
		_diff_y = _inst.y - _ypad_pos;
		_vy = _camy + cam_vel_y;
		_moving = true;
	}

	_ypad_pos = _center_y - pad_y;
	if ( _inst.y <= _ypad_pos )
	{
		_diff_y = _ypad_pos - _inst.y;
		_vy = _camy - cam_vel_y;
		_moving = true;
	}

	// Increase the velocity of the camera so it catches up faster each frame
	if ( _moving == true )
	{
		cam_vel = cam_vel + 0.50;
		cam_vel_y = cam_vel_y + 0.50;

		cam_vel = clamp(cam_vel,0,_diff_x);
		cam_vel_y = clamp(cam_vel_y,0,_diff_y);
	} else
	{
		cam_vel = 0;
	}


// Screen transfer
// Changed this from when the fish moves off the room cords to right when the mouse does.
// I belive this change make things look smoother

	_vy = clamp(_vy,0,room_height - view_height);

	if ( mouse_x > room_width and _player.is_eating == false )
	{
		_vx = _vx - room_width;
		_player.x = _player.x - room_width;
		_inst.x = _inst.x - room_width;
	} 
	else if ( mouse_x < 0 and _player.is_eating == false )
	{
		_vx = _vx + room_width;
		_player.x = _player.x + room_width;
		_inst.x = _inst.x + room_width;
	}



	if ( _moving == false )
	{
		_vx = floor(_vx);
		_vy = floor(_vy);
	}

	camera_set_view_pos(view_camera[0], _vx , _vy );
	//camera_set_view_pos(view_camera[0],floor(_vx),floor(_vy));
}
