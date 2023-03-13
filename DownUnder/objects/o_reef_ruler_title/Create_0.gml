//var _value = mystruct[$ "x"];
top_players = [];
sorted_list = [];
sorted_index = 0;
col_name = "NAME";
col_score = "SCORE";

var _cam = view_camera[0];
var _vw = camera_get_view_width(_cam);
var _vh = camera_get_view_height(_cam);
var _btn_w = 60;
var _btn_h = 40;

var _btn_x = (_vw / 2) - (_btn_w / 2);
var _btn_y = _vh - (_btn_h * 2);

exit_btn = new basic_button(_btn_x,_btn_y, _btn_w, _btn_h, 0, "Return");

if ( global.GAME_MODE != PRACTICE )
{
	top_players = global.reef_rulers[$ global.GAME_MODE];
}

if ( array_length(top_players) > 0 )
{
	var _top_ten = 0;
	while ( _top_ten < 10 )
	{
		var _largest_score = -1;
		var _index = 0;

		for ( var i = 0; i < array_length(top_players); i++ )
		{
			var _player = top_players[@ i]; // struct
			if ( _player.my_score > _largest_score )
			{
				_largest_score = _player.my_score;
				_index = i;
			}
		}


		sorted_list[@ sorted_index] = top_players[@ _index];
		array_delete(top_players, _index, 1);
		sorted_index = sorted_index + 1;
		if ( array_length(top_players) <= 0 ) then break;

		_top_ten = _top_ten + 1;
	}
}
