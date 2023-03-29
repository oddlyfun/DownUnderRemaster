
FULL_SCREEN = window_get_fullscreen();

supported_resolutions = [
	"640 x 360",
	"1280 x 720",
	"1920 x 1080",
	"2560 x 1440"
];

my_window = new window_popup(400,160,"Graphic Settings",4);
my_window.change_anchor_config(6,6,my_window.x, my_window.y);


var _anchor = my_window.ac_points;

fs_checkbox = new check_box(0,0,"Fullscreen");


fs_checkbox.checked = FULL_SCREEN;