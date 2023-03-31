my_window.check_close_hover();
ability_drop.toggle_click_check();

play_btn.check_hover();
close_btn.check_hover();

input_fish_name.clicked_on();
input_fish_name.typing_on_me();

var _agility = attr_index[0];
var _endurance = attr_index[1];
var _size = attr_index[2];




if ( mouse_check_button_pressed(mb_left) )
{
	if ( my_window.hover_close == true  or close_btn.hover == true)
	{
		instance_create_layer(0,0,"Instances",o_game_mode_selector);
		instance_destroy(id);
	}

	if ( play_btn.hover == true )
	{
		global.player_fish_id = CAF_ID;
		global.SHADER_COLOR = COLOR_PICK;
		CAF_STRUCT.sprite_name = CAF_sprite_string; // string value
		CAF_STRUCT.ability = ability_drop.item_list[@ ability_drop.selected_index]; //should be a string
		CAF_STRUCT.full_name = input_fish_name.string_value;
		CAF_STRUCT.energy_rate = agi_results[_agility];
		CAF_STRUCT.health_rate = end_results[_endurance];
		CAF_STRUCT.food_good   = siz_results[_size];
		room_goto(ro_game);
	}
}


var _spr_string = "spr_CAF_";
var _winner_index = 1;

//Size wins
if ( _size >= _agility and _size >= _endurance )
{
	switch _size
	{
		case 0:
		case 1:
		case 2:
			_winner_index = 1;
			break;
		case 3:
		case 4:
		case 5:
			_winner_index = 4;
			break;
		break;
		default:
			_winner_index = 7;
		break;
	}
	
} else if ( _agility > _size and _agility >= _endurance ) 
{
	// agility is the largest number
	switch _agility
	{
		case 0:
		case 1:
		case 2:
			_winner_index = 2;
			break;
		case 3:
		case 4:
		case 5:
			_winner_index = 5;
			break;
		break;
		default:
			_winner_index = 8;
		break;
	}
} else if ( _endurance > _size and _endurance > _agility ) 
{
	// agility is the largest number
	switch _endurance
	{
		case 0:
		case 1:
		case 2:
			_winner_index = 3;
			break;
		case 3:
		case 4:
		case 5:
			_winner_index = 6;
			break;
		break;
		default:
			_winner_index = 9;
		break;
	}
}


CAF_sprite_string = _spr_string + string(_winner_index);
