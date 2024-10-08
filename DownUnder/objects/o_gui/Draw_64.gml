var _width = display_get_gui_width();
var _height = display_get_gui_height();

var _start_y = _height - BAR_SIZE;
var _player = instance_nearest(x,y,o_player_fish);
var _mouse = instance_nearest(x,y,o_mouse);

draw_rectangle_color(0, _start_y, _width, _height, BAR_BG, BAR_BG, BAR_BG,BAR_BG, false );
draw_line_color(0, _start_y - 1, _width, _start_y - 1, c_black, c_black);

//*********************************************************************************************************
//
//						'Info' text based on what you are hoving over. 
//
//*********************************************************************************************************
var _info_message = "";
var _hover_inst = _mouse.hover_inst;
// I don't want to see the player fish included. _player is a child of o_sea_life 
if ( _hover_inst != noone and _hover_inst != _player and instance_exists(_hover_inst) )
{
	_info_message = _hover_inst.fish_name;

	draw_set_font(FONT);
	draw_set_color(c_black);
	draw_text(4, _start_y + 2, _info_message);
}

//*********************************************************************************************************
//
//						Health and Energy bar of the player fish
//
//*********************************************************************************************************
draw_set_font(FONT);
draw_set_color(c_black);

var _energy_txt = "ENERGY: "
var _health_txt = "HEALTH: "

var _hpbar_start_x = floor(_width * 0.45);

draw_text(_hpbar_start_x - string_width(_energy_txt), _start_y + 1, _energy_txt);
draw_text(_hpbar_start_x - string_width(_health_txt), _start_y + string_height(_energy_txt) + 1, _health_txt);

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
	_stx = _hpbar_start_x;
	_sty = _start_y + 2;
	
	_energy = _energy / 100;
	var _total_block_size = (EMPTY_BLOCK_W * NUM_OF_BLOCKS);
	var _block_energy = (_total_block_size) * _energy;
	var _block_w = EMPTY_BLOCK_W;

	var _c = c_white;
		
	//*********************************************************************************
	//						Draw Energy Bars filled in
	//*********************************************************************************
	_c = ENERGY_COLOR;
	if ( _energy * 100 <= WARNING_THRESH ) then _c = WARN_COLOR;
	if ( _energy * 100 <= BAD_THRESH ) then _c = BAD_COLOR;
	
	for ( var i = 0; i < NUM_OF_BLOCKS; i++ )
	{
		if ( _block_energy > ((i) * _block_w) )
		{
			draw_rectangle_color(_stx, _sty, _stx + EMPTY_BLOCK_W, _sty + EMPTY_BLOCK_H, _c, _c, _c, _c, false );
			_stx = _stx + EMPTY_BLOCK_W + 2;			
		}
	}
	//*********************************************************************************
	//						Draw HP blocks filled in
	//*********************************************************************************
	
	_stx = _hpbar_start_x;
	_sty = _start_y + 4 + EMPTY_BLOCK_H;
	var _health = _player.my_health;
	_health = _health / 100;
	var _block_health = _total_block_size * _health;


	_c = ENERGY_COLOR;
	if ( _health * 100 <= WARNING_THRESH ) then _c = WARN_COLOR;
	if ( _health * 100 <= BAD_THRESH ) then _c = BAD_COLOR;

	for ( var i = 0; i < NUM_OF_BLOCKS; i++ )
	{
		if ( _block_health > ((i) * _block_w) )
		{
			draw_rectangle_color(_stx, _sty, _stx + EMPTY_BLOCK_W, _sty + EMPTY_BLOCK_H, _c, _c, _c, _c, false );
			_stx = _stx + EMPTY_BLOCK_W + 2;			
		}
	}


//*********************************************************************************************************
//
//						Score Display * No score should display if its practice mode
//
//*********************************************************************************************************

	
	draw_set_color(c_black);
	draw_set_font(FONT);
	var _score_x = _width - string_width("Score: ###,###") - 10;
	var _score_y = _height - BAR_SIZE + 4;
	var _score_string = "Score: " + string(_player.my_score);
	
	if ( global.LEVEL_OVER == true )
	{
		_score_string = "Score: " + string(global.player_score);
	}
	
	if ( global.GAME_MODE != PRACTICE ) {
		draw_text(_score_x, _score_y, _score_string);
	} else
	{
		draw_text(_score_x, _score_y, "Practice Mode");
	}
}
