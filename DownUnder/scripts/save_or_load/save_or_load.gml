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

function load_reef_rulers()
{
	var _filename = global.REEF_RULER_FILENAME;

	var _empty_ruler = {
		challenge : {
			id_0 : {
				name : noone,
				my_score : -1
			},
		},
		gauntlet : {
			id_0 : {
				name : noone,
				my_score : -1
			},
		},
	};


	if ( file_exists(_filename) )
	{
	    var _buffer = buffer_load(_filename);
	
	    var _str = buffer_read(_buffer, buffer_text);
	    buffer_delete(_buffer);
	    var data = json_parse(_str);
		return data;
	}
	

	return _empty_ruler;
}
