function save_my_game()
{
	var _filename = global.GAME_FILENAME;
	
	var _save = {
		mode : global.GAME_MODE,
		fish_list : global.LOAD_GAME_LIST,
		my_score : global.player_score
	};
	
	var _str = json_stringify(_save);
	var _buffer = buffer_create(string_byte_length(_str), buffer_fixed,1);
	buffer_write(_buffer, buffer_text, _str);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

function load_my_game()
{
	var _filename = global.GAME_FILENAME;
	if ( file_exists(_filename) )
	{
	    var _buffer = buffer_load(_filename);
	
	    var _str = buffer_read(_buffer, buffer_text);
	    buffer_delete(_buffer);
	    var data = json_parse(_str);

		global.GAME_MODE = data.mode;
		global.LOAD_GAME_LIST = data.fish_list;
		global.player_score = data.my_score;
		return true;
	}
	
	return false;
}

function remove_save_file()
{
	if ( file_exists(global.GAME_FILENAME) ) then file_delete(global.GAME_FILENAME);
}


function save_reef_rulers()
{
	var _filename = global.REEF_RULER_FILENAME;
	var _str = json_stringify(global.reef_rulers);
	var _buffer = buffer_create(string_byte_length(_str), buffer_fixed,1);
	buffer_write(_buffer, buffer_text, _str);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

function add_reef_ruler(_the_ruler)
{
	var _save = {
		mode : global.GAME_MODE,
		player_name : _the_ruler,
		my_score : global.player_score
	};


	var _ruler_struct = global.reef_rulers;
	var _ruler_array = [];

	if ( global.GAME_MODE == GAUNTLET )
	{
		_ruler_array = _ruler_struct[$ GAUNTLET];
	} 
	else if ( global.GAME_MODE == CHALLENGE )
	{
		_ruler_array = _ruler_struct[$ CHALLENGE];
	} 
	else if ( global.GAME_MODE == CREATE_A_FISH )
	{
		_ruler_array = _ruler_struct[$ CREATE_A_FISH];
	}

	var _size = array_length(_ruler_array);
	_ruler_array[@ _size] = _save;
	
	save_reef_rulers();
}

function empty_reef_ruler()
{
	var _top_level;
	var _gaunt = [];
	var _chall = [];
	var _fishy = [];


	_top_level = {
		G 	: _gaunt,
		C 	: _chall,
		CAF : _fishy
	};

	return _top_level;
}


function load_reef_rulers()
{
	var _filename = global.REEF_RULER_FILENAME;

	if ( file_exists(_filename) )
	{
	    var _buffer = buffer_load(_filename);
	
	    var _str = buffer_read(_buffer, buffer_text);
	    buffer_delete(_buffer);
	    var data = json_parse(_str);
		return data;
	} else
	{
		return empty_reef_ruler();
	}
}

function load_game_settings()
{
	var _filename = global.GAME_SETTINGS_FILENAME;
	var _buffer = 0;

	if ( file_exists(_filename) )
	{
	    _buffer = buffer_load(_filename);
	} else
	{
	    _buffer = buffer_load("default_game_settings.json");
	}

	var _str = buffer_read(_buffer, buffer_text);
	buffer_delete(_buffer);
	var data = json_parse(_str);
}

function save_game_settings()
{
	var _filename = global.GAME_SETTINGS_FILENAME;

	var _settings_struct = {
		res_x : window_get_width(),
		res_y : window_get_height(),
		res_index : global.RES_INDEX,
		music_gain : global.MUSIC_GAIN,
		sfx_gain : global.SFX_GAIN,
		fullscreen : window_get_fullscreen()
	}

	var _str = json_stringify(_settings_struct);
	var _buffer = buffer_create(string_byte_length(_str), buffer_fixed,1);
	buffer_write(_buffer, buffer_text, _str);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}
