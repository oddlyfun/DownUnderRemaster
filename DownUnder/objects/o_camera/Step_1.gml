var _inst = instance_nearest(0,0,o_cam_help);

var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _center_x = _camx + (view_width / 2 );
var _center_y = _camy + (view_height / 2 );


var _vx = _camx;
var _vy = _camy;



var _x_ = _center_x + pad_x;
if ( _inst.x >= _x_ ) {
	_vx = _camx + (_inst.x - _x_);
}

_x_ = _center_x - pad_x;
if ( _inst.x <= _x_ ) {
	_vx = _camx - (_x_ - _inst.x);
}

var _y_ = _center_y + pad_y;
if ( _inst.y >= _y_ ) {
	_vy = _camy + (_inst.y - _y_);
}

_y_ = _center_y - pad_y;
if ( _inst.y <= _y_ ){
	_vy = _camy - (_y_ - _inst.y);
}


_vy = clamp(_vy,0,room_height - view_height);



camera_set_view_pos(view_camera[0],_vx,_vy);