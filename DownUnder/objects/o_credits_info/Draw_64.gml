credit_window.draw_me();
close_btn.draw_me();

//credit_window.draw_ac_points();

var _pos = credit_window.ac_points;


var _dev = _pos[4,1];

write_text(_dev.x, _dev.y, c_black, dev_lines );


var _art = _pos[1,3];

var _y = _art.y;
var _x = _art.x;

for ( var i = 0; i < array_length(artist_lines); i++ )
{
	var _str = artist_lines[i];	
	write_text(_x, _y, c_black, _str);
	_y = _y + string_height(_str) + 1;
}


var _music = _pos[8,3];

var _y = _music.y;
var _x = _music.x;

for ( var i = 0; i < array_length(music_lines); i++ )
{
	var _str = music_lines[i];	
	write_text(_x, _y, c_black, _str);
	_y = _y + string_height(_str) + 1;
}