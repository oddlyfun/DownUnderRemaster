if ( instance_exists(my_target) )
{
	direction = point_direction(x, y, my_target.x, my_target.y);
	speed = 3;
} else
{
	my_target = instance_nearest(o_target);
	direction = point_direction(x, y, my_target.x, my_target.y);

	var _dist = point_distance(x,y, my_target.x, my_target.y);

	if ( _dist <= 5 )
	{
		speed = 0;
		direction = 0;
	}
}

image_angle = direction;
