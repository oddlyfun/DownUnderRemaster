my_window.draw_me();
//my_window.draw_ac_points();



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
	// collide
	
	var _whole_width = (attr_block_w * attr_max_blocks) + ( 4 * attr_max_blocks);
	_check = gui_element_collision(_apos_x, _apos_y-4, _whole_width, attr_block_h+8);
	if ( mouse_check_button_pressed(mb_left) )
	{
		if ( _check == true )
		{
			var _index = floor( (mouse_x - camera_get_view_x(view_camera[0]) - _apos_x ) / (attr_block_w+4) );
			//show_debug_message(string(_index) +"," + string(i));
			attr_index[@ i] = _index;
		}
	}
	
	
	// BLOCKS
	for ( var z = 0; z < attr_max_blocks; z++ )
	{
		//outline
		//draw_rectangle_colour(x1, y1, x2, y2, col1, col2, col3, col4, outline);
		var _x2 = _apos_x + attr_block_w;
		var _y2 = _apos_y + attr_block_h;
		draw_rectangle_color(_apos_x-1, _apos_y-1, _x2+1, _y2+1, _b,_b,_b,_b, false);
	
		if ( attr_index[@ i] >= z )
		{
			draw_rectangle_color(_apos_x, _apos_y, _x2, _y2, col_block,col_block,col_block,col_block, false);	
		} 
		else
		{
			draw_rectangle_color(_apos_x, _apos_y, _x2, _y2, col_empty,col_empty,col_empty,col_empty, false);
		}

		_apos_x = _apos_x + attr_block_w + 4;
	}
	_apos_x = _apos.x;
	_apos_y = _apos_y + attr_block_h + 8;
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



_apos = _anchors[0,5];
_apos_x = _apos.x + color_block_size;
_apos_y = _apos.y;
var _cbb = 2;


for ( var i = 0; i < array_length(color_list); i++ )
{
	var _col = color_list[@ i];

	if ( color_index == i )
	{
		draw_rectangle_color(_apos_x - _cbb, _apos_y - _cbb, _apos_x + color_block_size + _cbb, _apos_y + color_block_size + _cbb, c_black, c_black, c_black, c_black, false);
	}

	draw_rectangle_color(_apos_x, _apos_y, _apos_x + color_block_size, _apos_y + color_block_size, _col, _col, _col, _col, false);
	_check = gui_element_collision(_apos_x, _apos_y, color_block_size, color_block_size);

	if ( mouse_check_button_released(mb_left) )
	{
		if ( _check == true )
		{
			color_index = i;
		}
	}
	
	
	_apos_y = _apos_y + color_block_size + 6;

}

/*
color_list = [c_blue, c_green, c_purple, c_red, c_yellow];
color_index = 0;
*/
switch color_index 
{
	case 0:
		COLOR_PICK = BLUE;
	break;
	case 1:
		COLOR_PICK = GREEN;
	break;
	case 2:
		COLOR_PICK = PURPLE;
	break;
	case 3:
		COLOR_PICK = RED;
	break;
	case 4:
		COLOR_PICK = YELLOW;
	break;
}


//***********************************************************************************
//
// Draw Fish Image
//
//***********************************************************************************


_apos = _anchors[1,5];
_apos_x = _apos.x;
_apos_y = _apos.y;

var _ocean_width = 140;
var _ocean_height = 120; 


if ( CAF_image_index > sprite_get_number(spr_CAF_01) )
{
	CAF_image_index = 0;
}

draw_sprite_part(spr_BG_Game,0,0,0,_ocean_width,_ocean_height, _apos_x, _apos_y);

shader_set(shd_color_caf);
	shader_set_uniform_f_array(uni_color,COLOR_PICK);
	draw_sprite(spr_CAF_01, CAF_image_index, _apos_x + (_ocean_width/2), _apos_y + (_ocean_height/2) );
shader_reset();


CAF_image_index = CAF_image_index + CAF_animation_speed;

//***********************************************************************************
//
//  		Name That Fish!
//
//***********************************************************************************

play_btn.draw_me();
close_btn.draw_me();
input_fish_name.draw_me();
ability_drop.draw_me();