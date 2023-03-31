randomize();
global.GAME_FPS = 60;
game_set_speed(global.GAME_FPS, gamespeed_fps);

window_set_cursor(cr_none);
global.PAUSED = false;
global.LEVEL_OVER = false;
global.WIN_LEVEL = false;

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

global.font_chunky_map = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{|}~ "
global.fnt_spr_chunky = font_add_sprite_ext(spr_font_chunky, global.font_chunky_map,false,0);

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
#macro ANYTIME "ANYTIME"
#macro DAY "DAY"
#macro NIGHT "NIGHT"

// Save File info
global.GAME_MODE = PRACTICE;
global.TIME_OF_DAY = ANYTIME;
global.LOAD_GAME_LIST = noone;
global.GAME_FILENAME = "DownUnder.save";
global.REEF_RULER_FILENAME = "ReefRulers.save";
global.player_fish_id = 5;
global.player_score = 0;
global.reef_rulers = load_reef_rulers();

global.SHADER_COLOR = [0.0,0.0,0.0];
//
// Orginize all sea life into different lists based on their attributes
// These lists will contain structs with added field of the fish ID
global.playable_fish = ds_list_create();
global.fish_DAY = ds_list_create();
global.fish_NIGHT = ds_list_create();
global.fish_ANYTIME = ds_list_create();
global.fish_STATIC = ds_list_create();

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

	var _fish_active = _fish.active;

	switch ( _fish_active )
	{
		case "DAY":
			ds_list_add(global.fish_DAY,_fish);
		break;

		case "NIGHT":
			ds_list_add(global.fish_NIGHT,_fish);
		break;

		case "ANYTIME":
			ds_list_add(global.fish_ANYTIME,_fish);
		break;

		default:
			ds_list_add(global.fish_STATIC,_fish);
		break;
	}
}

event_user(0);