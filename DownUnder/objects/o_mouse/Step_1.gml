var _hover_list = ds_list_create();
var _x = x;

if ( x < 0 )
{
	_x = (x + room_width);
} else if ( x > room_width )
{
	_x = (x - room_width);
}

var _number_of = instance_place_list(_x, y, o_sea_life, _hover_list, false);
var _player_food = instance_nearest(x,y,o_player_fish);

if ( _number_of > 0 )
{
	hover_inst = _hover_list[| 0];
} else if ( _number_of == 0 )
{
	hover_inst = noone;
}


for ( var i = 0; i < ds_list_size(_hover_list); i++ )
{
	var _edible = s_check_food(_player_food,_hover_list[| i]);
	
	if ( _edible.edible == true )
	{
		hover_inst = _hover_list[| i];
		break;
	}
}

ds_list_destroy(_hover_list);