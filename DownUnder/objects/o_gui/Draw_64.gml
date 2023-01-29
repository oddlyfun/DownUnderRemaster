var _width = display_get_gui_width();
var _height = display_get_gui_height();

var _start_y = _height - BAR_SIZE;
var _player = instance_nearest(x,y,o_player_fish);
// I want it to look like an old school game and have a basic bottom bar

// bottom bar colors from Odell


draw_rectangle_color(0, _start_y, _width, _height, BAR_BG, BAR_BG, BAR_BG,BAR_BG, false );
draw_line_color(0, _start_y - 1, _width, _start_y - 1, c_black, c_black);


draw_set_font(fnt_small);
draw_set_color(c_black);


var _energy = "ENERGY: "
var _health = "HEALTH: "

var _hpbar_start_x = floor(_width * 0.35);

draw_text(_hpbar_start_x - string_width(_energy), _start_y + 1, _energy);
draw_text(_hpbar_start_x - string_width(_health), _start_y + string_height(_energy) + 1, _health);

if ( _player != noone )
{
	var _stx = _hpbar_start_x;
	var _sty = _start_y + 2;
	
	// draws both empty blocks
	for ( var i = 0; i < NUM_OF_BLOCKS; i++ )
	{
		var _c = EMPTY_ENERGY_BG;
		draw_rectangle_color(_stx, _sty, _stx + EMPTY_BLOCK_W, _sty + EMPTY_BLOCK_H, _c, _c, _c, _c, false );
		var _hp_y = _sty + EMPTY_BLOCK_H + 2;
		draw_rectangle_color(_stx, _hp_y, _stx + EMPTY_BLOCK_W, _hp_y + EMPTY_BLOCK_H, _c, _c, _c, _c, false );
		_stx = _stx + EMPTY_BLOCK_W + 2;
	}
	
	
	//draw filled blocks
	
	var _energy = _player.my_energy;
	
	_energy = _energy / 100;
	var _total_block_size = (EMPTY_BLOCK_W * NUM_OF_BLOCKS);
	var _block_energy = (_total_block_size) * _energy;

	
	
	
	
	
	
}