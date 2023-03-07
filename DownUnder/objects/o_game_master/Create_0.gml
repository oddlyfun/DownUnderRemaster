randomize();
global.GAME_FPS = 60;
game_set_speed(global.GAME_FPS, gamespeed_fps);

window_set_cursor(cr_none);
global.PAUSED = false;
// loading the sea life json data
global.all_life = undefined;
global.all_life_json_filename = "sea_life.json";

if ( file_exists(global.all_life_json_filename))
{
	var _buffer = buffer_load(global.all_life_json_filename);
	var _string = buffer_read(_buffer, buffer_string);
	global.all_life = json_parse(_string);
}


global.message_q = ds_queue_create();


global.font_small_map = "! \"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{|}~"
global.fnt_spr_small = font_add_sprite_ext(spr_font_small,global.font_small_map,false,0);

// State Machine Brain
#macro ENERGY 0
#macro SWIM 1
#macro THREAT 2
#macro HEALTH 3
#macro PLAYER 4

#macro PRACTICE  "P"
#macro GAUNTLET  "G"
#macro CHALLENGE  "C"
#macro CREATE_A_FISH "CAF"
#macro FONT  global.fnt_spr_small

// Save File info
global.GAME_MODE = PRACTICE;
global.LOAD_GAME_LIST = noone;
global.GAME_FILENAME = "DownUnder.save";
global.REEF_RULER_FILENAME = "ReefRulers.save";
global.player_fish_id = 5;
global.player_score = 0;
global.reef_rulers = load_reef_rulers();
//
// Orginize all sea life into different lists based on their attributes
// These lists will contain structs with added field of the fish ID
global.playable_fish = ds_list_create();
global.fish_ES = ds_list_create();
global.fish_S = ds_list_create();
global.fish_MS = ds_list_create();
global.fish_M = ds_list_create();
global.fish_ML = ds_list_create();
global.fish_L = ds_list_create();
global.fish_EL = ds_list_create();
global.fish_NA = ds_list_create();

// gives me the size of the struct
// the ids are all numbers 1 - 81 ... easy to loop
var _life_size = variable_struct_names_count(global.all_life);

for ( var i = 0; i < _life_size; i++ )
{

	var _fish = variable_struct_get(global.all_life, string(i+1) );
	_fish.fish_id = i+1;

	// split off the fish based on its attributes
	if ( _fish.playable == "Y" )
	{
		//_fish.notes = new 
		ds_list_add(global.playable_fish, _fish);
	}

	var _fish_size = _fish.size;

	switch ( _fish_size )
	{
		case "ES":
			ds_list_add(global.fish_ES,_fish);
		break;

		case "S":
			ds_list_add(global.fish_S,_fish);
		break;

		case "MS":
			ds_list_add(global.fish_MS,_fish);
		break;

		case "M":
			ds_list_add(global.fish_M,_fish);
		break;

		case "ML":
			ds_list_add(global.fish_ML,_fish);
		break;

		case "L":
			ds_list_add(global.fish_L,_fish);
		break;

		case "EL":
			ds_list_add(global.fish_EL,_fish);
		break;

		default:
			ds_list_add(global.fish_NA,_fish);
		break;
	}
}
