
function draw_text_wrap(_x, _y, _width, _height, _words)
{
	draw_set_color(c_black);
	draw_set_font(fnt_game);

	var _top_buffer = 4;
	var _right_buffer = 4;

	_x = _x + _right_buffer;
	_y = _y + _top_buffer;
	//string_split(string, delimiter, [remove_empty], [max_splits]);
	var _word_array = string_split(_words, " "); // this is new I hope it works in the TTL


	var _size = array_length(_word_array);
	var _ini_x = _x;
	var _ini_y = _y;
	var _right_bound = _x + _width;

	for ( var i = 0; i < _size; i++ )
	{
		var _word = _word_array[@ i];
		var _word_len = string_width(_word);

		if ( _ini_x + _word_len >= _right_bound )
		{
			// the word if written would overflow
			_ini_x = _x;
			_ini_y = _ini_y + string_height(_word + _top_buffer);
		}

		draw_text(_ini_x, _ini_y, _word);
		_ini_x = _ini_x + _word_len + string_width(" ");

	}

}


/* 
function create_string_array( _words )
{
	//string_length(str)
	//string_char_at(str,index)
	//string_copy(str, index, count);
	var _array = [];
	var _index = 0;

	var _sub_string_start = 1;
	var _length = string_length(_words);

	// String index starts at 1
	var _word = "";
	for ( var i = 1; i <= _length; i++ )
	{
		var _char = string_char_at(_words,i);
		if ( _char == " " )
		{
			var _a_word = string_copy(_words, _sub_string_start, i-1);
			_array[@ _index] = _a_word;
			_index = _index + 1;
			_sub_string_start = i + 1;
		}
	}
}
*/
