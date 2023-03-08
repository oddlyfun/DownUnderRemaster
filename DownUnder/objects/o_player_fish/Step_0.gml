if ( global.PAUSED == true ) then exit;


var _cursor = instance_nearest(0,0,o_mouse);
if ( !instance_exists(_cursor) ) then exit;

if ( is_eating == false )
{
	direction = point_direction(x,y,mouse_x,mouse_y);
	var _dist = floor(distance_to_point(mouse_x,mouse_y));

	var _energy_redux = 0;

	if ( _dist <= max_speed ){
		speed = 0;
		_energy_redux = energy_decline * 0.95;
		
	} else
	{
		speed = max_speed;
		my_score = my_score + 1;
		_energy_redux = energy_decline * 1.05;
	}

	my_energy = my_energy - _energy_redux;
	my_health = my_health - health_decline;

//******************************************************************
//			Clicking on some sea life (when not eating)
//******************************************************************

	if ( mouse_check_button_pressed(mb_left) )
	{
		var _cursor_target = _cursor.hover_inst;
		
		if ( instance_exists(_cursor_target) ) 
		{
			eating_x = _cursor.x;
			eating_y = _cursor.y;
			_dist = point_distance(x,y, eating_x, eating_y);
		
			if ( _dist < eating_distance )
			{
				is_eating = true;
				eating_target = _cursor_target;
				eating_target.frozen = true;
			}
		}
	}
}


if ( is_eating == true )
{

	direction = point_direction(x,y,eating_x, eating_y);
	var _dist = floor(distance_to_point(eating_x, eating_y));

	if ( _dist <= max_speed )
	{
		speed = 0;
		eating_target.frozen = false;
		var _was_eaten = s_check_food(id, eating_target);
		// done eating
		if ( _was_eaten.edible == true )
		{
			my_energy = my_energy + energy_recovery;
			my_energy = clamp(my_energy,0, 100);

			var _nibble = false;
			for ( var n = 0; n < array_length(my_tags); n++)
			{
				if ( my_tags[@ n] == "nibble") then _nibble = true;
			}
			
			if ( eating_target.destroyed_when_eaten == true and _nibble == false )
			{
				instance_destroy(eating_target);
			}
		}
		add_message(_was_eaten.msg, _was_eaten.fish_name);
		eating_target = noone;
		is_eating = false;
	} else
	{
		speed = max_speed;
	}
}

x = floor(x);
y = floor(y);
