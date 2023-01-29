var _player = instance_nearest(x,y,o_player_fish);


if (instance_exists(_player))
{
	var _lerp_y = lerp(mouse_y, _player.y, 0.50);
	var _lerp_x = lerp(mouse_x, _player.x, 0.50);
	
	x = _lerp_x;
	y = _lerp_y;
}