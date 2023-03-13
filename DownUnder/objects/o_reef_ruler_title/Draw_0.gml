//global.reef_rulers
//sorted_list = [];

draw_self();


var _mode = global.GAME_MODE;



var _title_x = 50;
var _title_y = 50;
var _col_score_x = _title_x + 100;


write_text(_title_x, _title_y, c_black, col_name);
write_text(_col_score_x, _title_y, c_black, col_score);


_title_y = _title_y + (string_height("000")*2 );


for ( var i = 0; i < array_length(sorted_list); i++ )
{
	var _player = sorted_list[@ i];
	var _name = _player.player_name;
	var _score = string( _player.my_score );


	write_text(_title_x, _title_y, c_black, _name );

	write_text(_col_score_x, _title_y, c_black, _score);

	_title_y = _title_y + (string_height("000")*2 );
}



exit_btn.draw_me();
