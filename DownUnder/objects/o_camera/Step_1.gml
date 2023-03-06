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
// _x_ is the center of the screen play some padding so its offset and when the
// instance pushes against that 'line' is will move the camera view
var _x_ = _center_x + pad_x;
if ( instance_exists(_player) ) {
	if ( _inst.x >= _x_ ) {
		// lerp will return the x value based on the % [0-1] between two points
		// from x line to the instance.x  1 is the value of _inst.x and 0 vel would be the _x_ or standing still obviously
		var _diff = lerp(_x_, _inst.x, cam_vel) - _x_;
		_vx = _vx + _diff; //_camx + (_inst.x - _x_);
		_moving = true;
	}

	_x_ = _center_x - pad_x;
	if ( _inst.x <= _x_ ) {
		var _diff = _x_ - lerp(_x_, _inst.x, cam_vel);

		_vx = _vx - _diff; 
		_moving = true;
	}

	var _y_ = _center_y + pad_y;
	if ( _inst.y >= _y_ ) {
		_vy = _camy + (_inst.y - _y_);
	}

	_y_ = _center_y - pad_y;
	if ( _inst.y <= _y_ ){
		_vy = _camy - (_y_ - _inst.y);
	}

	// Increase the velocity of the camera so it catches up faster each frame
	if ( _moving == true )
	{
		cam_vel = cam_vel + 0.01;
	} else
	{
		cam_vel = 0.10;
	}



	_vy = clamp(_vy,0,room_height - view_height);
	//_vx = clamp(_vx,-room_width, room_width * 2);

	// I clamp the value of vx in a different var to check to see if I would be passed the edges on this frame then instead I just move 
	// all the relavent instances and camera 
	var _wrap_x = clamp(_vx, -room_width, (room_width * 2) - view_width);

	if (_wrap_x == -room_width and _player.is_eating == false)
	{
		_vx = _vx + room_width;
		_player.x = _player.x + room_width;
		_inst.x = _inst.x + room_width;
	}

	if ( _wrap_x == (room_width * 2) - view_width and _player.is_eating == false)
	{
		_vx = _vx - room_width;
		_player.x = _player.x - room_width;
		_inst.x = _inst.x - room_width;
	}

	camera_set_view_pos(view_camera[0],floor(_vx),floor(_vy));
}
