function save_my_game()
{
	var _filename = global.GAME_FILENAME;
	
	var _save = {
		mode : global.GAME_MODE,
		fish_list : global.LOAD_GAME_LIST
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
		return true;
	}
	
	return false;
}

function remove_save_file()
{
	if ( file_exists(global.GAME_FILENAME) ) then file_delete(global.GAME_FILENAME);
}