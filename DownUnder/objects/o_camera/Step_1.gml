var _inst = instance_nearest(0,0,o_fish);


if ( _inst != noone )
{
	var _x = _inst.x - ( view_width / 2 );
	var _y = _inst.y - ( view_height / 2);
	
	var _vx = clamp(_x,0, room_width - view_width );
	var _vy = clamp(_y,0, room_height - view_height );
	
	
	
	
	camera_set_view_pos(view_camera[0],_vx,_vy);
}