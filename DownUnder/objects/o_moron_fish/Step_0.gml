var _point = instance_nearest(x,y,o_target);

if ( _point != noone )
{
	if ( state == 0 )
	{
		direction = point_direction(x, y, _point.x, _point.y);
		speed = 3;

	} else if ( state == 1)
	{
		var _max = _point.x + 20;
		var _min = _point.x - 20;
		speed = 0; 

		if ( x >= _max )
		{
			direction = 180;
		} else if ( x <= _min )
		{
			direction = 0;
		}
	}
}

image_angle = direction;