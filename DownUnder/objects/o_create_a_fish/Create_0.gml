var _cam = view_camera[0];
var _vw = display_get_gui_width();
var _vh = display_get_gui_height();

my_win_w = floor(_vw * 0.70);
my_win_h = floor(_vh * 0.85);

my_window = new window_popup(my_win_w,my_win_h, "Create a Fish", 4, true); 
my_window.change_anchor_config(14,6,my_window.x, my_window.y);

col_empty = make_color_rgb(96,104,143);
col_block = make_color_rgb(104,247,72);
max_points = 1500;

// Attribs
attr_list = ["Agility", "Endurance", "Size"];
attr_index = [0,0,0];

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
color_list = [c_yellow, c_green, c_purple, c_red, c_blue];
color_index = 0;
color_block_size = 12;
color_block_width = 24;

CAF_ID = 81;
CAF_STRUCT = variable_struct_get(global.all_life, string(CAF_ID));
CAF_sprite_string = "spr_CAF_01";
CAF_image_index = 0;
CAF_animation_speed = 5 / 60;

// Ability Drop Down
ability_list = [
	"Sharp Spines",
	"Electric Shock",
	"Tail Stinger",
	"Inflating",
	"Intimidate",
	"Squirt Ink"
];


fishy_name = "Name";

var _anchors = my_window.ac_points;

_apos = _anchors[4,1];
input_fish_name = new input_bar(_apos.x,_apos.y,fishy_name);

_apos = _anchors[4,2];

ability_drop = new scroll_bar(_apos.x, _apos.y, ability_list, 6); 


_apos = _anchors[4,10];
var _bw = 60;
var _bh = 20;
play_btn = new basic_button(_apos.x, _apos.y, _bw, _bh, 0, "Play");
close_btn = new basic_button(_apos.x + play_btn.width + 10, _apos.y, _bw, _bh, 0, "Close");

max_points = 12;
agi_results = ["50", "55", "60", "70", "75", "80", "85", "100", "105", "110"];
end_results = ["50", "55", "60", "70", "75", "80", "85", "100", "105", "110"];


var _e0 = ["ES","69","76"];
var _e1 = ["ES", "S","76"];
var _e2 = ["ES", "S"];
var _e3 = ["ES", "S", "MS"];
var _e4 = ["ES", "S", "MS"];
var _e5 = ["ES", "S", "MS", "M"];
var _e6 = ["ES", "S", "MS", "M"];
var _e7 = ["ES", "S", "MS", "M"];
var _e8 = ["ES", "S", "MS", "M", "L"];
var _e9 = ["ES", "S", "MS", "M", "L"];
siz_results = [_e0, _e1, _e2, _e3, _e4, _e5, _e6, _e7, _e8, _e9];

how_to_play_pt0 = "Survive for 5 minutes in the Reef! Hold the RIGHT MOUSE BUTTON to use your ability.";