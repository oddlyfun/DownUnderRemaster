var _cam = view_camera[0];
var _vw = display_get_gui_width();
var _vh = display_get_gui_height();

my_win_w = floor(_vw * 0.85);
my_win_h = floor(_vh * 0.85);

CAF_ID = 81;
CAF_STRUCT = variable_struct_get(global.all_life, string(CAF_ID));

my_window = new window_popup(my_win_w,my_win_h, "Create a Fish", 4, true); 
my_window.change_anchor_config(14,6,my_window.x, my_window.y);

col_empty = make_color_rgb(96,104,143);
col_block = make_color_rgb(104,247,72);
max_points = 1500;

// Attribs
attr_list = ["Agility", "Endurance", "Size"];
attr_index = [0,0,0];
//attr_agi_index = 0;
//attr_end_index = 0;
//attr_siz_index = 0;

attr_max_blocks = 10;
attr_block_w = 6;
attr_block_h = 8;

// Color Choice
BLUE = 		[0.0, 0.0, 1.0];
GREEN = 	[0.0, 1.0, 0.0];
PURPLE = 	[1.0, 0.0, 1.0];
RED = 		[1.0, 0.0, 0.0];
YELLOW = 	[1.0, 1.0 ,0.0];
COLOR_PICK = BLUE;

uni_color = shader_get_uniform(shd_color_caf, "_custom_color");
color_list = [c_blue, c_green, c_purple, c_red, c_yellow];
color_index = 0;
color_block_size = 12;

CAF_sprite = spr_CAF_01;

// Ability Drop Down
ability_list = [
	"Sharp Spines",
	"Electric Shock",
	"Tail Stinger",
	"Squirt Ink"
];

ability_cost = [
	"100",
	"200",
	"300",
	"400"
];

fishy_name = "Bobby B";

var _anchors = my_window.ac_points;
_apos = _anchors[8,4];


var _bw = 60;
var _bh = 40;

play_btn = new basic_button(_apos.x, _apos.y, _bw, _bh, 0, "Play");
close_btn = new basic_button(_apos.x + play_btn.width, _apos.y, _bw, _bh, 0, "Close");


_apos = _anchors[4,1];
input_fish_name = new input_bar(_apos.x,_apos.y,fishy_name);
