draw_self();

var _mode = global.GAME_MODE;

var _vw = camera_get_view_width(view_camera[0]);
var _string_w = string_width("012345678901234567890") + 10 + string_width("###,###");

var _title_x = (_vw / 2) - (_string_w / 2);
var _title_y = 80;

draw_set_font(global.fnt_spr_chunky);
var _col_score_x = _title_x - string_width("###,###");
draw_set_font(global.fnt_spr_small);

//write_text(_title_x, _title_y, c_black, col_name);
//write_text(_col_score_x, _title_y, c_black, col_score);

_title_y = _title_y + (string_height("000")*2 );

for ( var i = 0; i < array_length(sorted_list); i++ )
{
	var _player = sorted_list[@ i];
	var _name = _player.player_name;
	var _score = string( _player.my_score );


	write_text(_title_x+1, _title_y+1, c_aqua, _name, global.fnt_spr_chunky);
	write_text(_title_x, _title_y, c_black, _name, global.fnt_spr_chunky); 

	write_text(_col_score_x+1, _title_y+1, c_aqua, _score, global.fnt_spr_chunky);
	write_text(_col_score_x, _title_y, c_black, _score, global.fnt_spr_chunky);

	_title_y = _title_y + floor( (string_height("000")*1.5 ));
}

exit_btn.draw_me();
