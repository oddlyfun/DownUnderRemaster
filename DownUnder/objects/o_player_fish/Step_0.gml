direction = point_direction(x,y,mouse_x,mouse_y);

var _dist = floor(distance_to_point(mouse_x,mouse_y));

var _energy_redux = energy_rate;

if ( _dist <= max_speed ){
	speed = 0;
	_energy_redux = energy_rate * 0.01;
	
} else
{
	speed = max_speed;
	_energy_redux = energy_rate * 0.05;
}


my_energy = my_energy - _energy_redux;