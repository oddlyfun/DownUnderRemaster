if ( instance_exists(my_target) )
{
	direction = point_direction(x, y, my_target.x, my_target.y);
	speed = 6;
} else
{
	var _my_new_target = instance_nearest(x,y,o_target);
	direction = point_direction(x, y, _my_new_target.x, _my_new_target.y);

	var _dist = point_distance(x,y, _my_new_target.x, _my_new_target.y);
	if ( _dist <= 5 )
	{
		speed = 0;
		direction = 0;
	}
}

image_angle = direction;
