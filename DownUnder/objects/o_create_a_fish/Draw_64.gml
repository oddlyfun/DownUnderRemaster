my_window.draw_me();
my_window.draw_ac_points();

var _anchors = my_window.ac_points;

// 3 Attributes for the fish
/*
// Attribs
attr_list =  ["Agility", 	"Endurance", 	"Size"];
attr_index = [0,			0,     			 0]

attr_max_blocks = 10;
attr_block_w = 4;
attr_block_h = 6;

function write_text(_x, _y, _color, _string, _font=global.fnt_spr_small)
*/

//***********************************************************************************
//
//Selection for the Agility(speed) / Endurance(Energy/Health) / Size (Small..Large)
//
//***********************************************************************************
var _apos = _anchors[1,1];
var _apos_x = _apos.x;
var _apos_y = _apos.y;
var _check = false;

for ( var i = 0; i < array_length(attr_list); i++ )
{
	var _name = attr_list[@ i];
	var _right_just = _apos_x - string_width(_name);
	write_text(_right_just - 4, _apos_y, c_black, _name);
	var _b = c_black;
	// BLOCKS
	for ( var z = 0; z < attr_max_blocks; z++ )
	{
		//outline
		//draw_rectangle_colour(x1, y1, x2, y2, col1, col2, col3, col4, outline);
		var _x2 = _apos_x + attr_block_w;
		var _y2 = _apos_y + attr_block_h;
		draw_rectangle_color(_apos_x-1, _apos_y-1, _x2+1, _y2+1, _b,_b,_b,_b, true);

		if ( attr_index[@ i] <= z )
		{
			draw_rectangle_color(_apos_x, _apos_y, _x2, _y2, col_block,col_block,col_block,col_block, false);
		} else
		{
			draw_rectangle_color(_apos_x, _apos_y, _x2, _y2, col_empty,col_empty,col_empty,col_empty, false);
		}


		_check = gui_element_collision(_apos_x, _apos_y, _x2 - _apos_x, _y2 - _apos_y);
		if ( mouse_check_button_released(mb_left) )
		{
			if ( _check == true )
			{
				attr_index[@ i] = z;
			}
		}


		_apos_x = _apos_x + attr_block_w + 4;
	}
	_apos_x = _apos.x;
	_apos_y = _apos_y + attr_block_h + 2;
}


//***********************************************************************************
//
//Selection for color of the fishy
/*
color_list = [c_blue, c_green, c_purple, c_red, c_yellow];
color_index = 0;
color_block_size = 12;
*/
//
//***********************************************************************************



_apos = _anchors[0,7];
_apos_x = _apos.x;
_apos_y = _apos.y;


for ( var i = 0; i < array_length(color_list) )
{
	var _col = color_list[@ i];

	if ( color_index == i )
	{
		draw_rectangle_color(_apos_x-3, _apos_y-3, _apos_x + color_block_size + 3, _apos_y + color_block_size + 3, c_black, c_black, c_black, c_black, false);
	}

	draw_rectangle_color(_apos_x, _apos_y, _apos_x + color_block_size, _apos_y + color_block_size, _col, _col, _col, _col, _col);
	_check = gui_element_collision(_apos_x, _apos_y, color_block_size, color_block_size);

	if ( mouse_check_button_released(mb_left) )
	{
		if ( _check == true )
		{
			color_index = i;
		}
	}

}
