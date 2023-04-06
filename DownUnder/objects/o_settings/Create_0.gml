
FULL_SCREEN = window_get_fullscreen();

supported_resolutions = [
	"640 x 360",
	"1280 x 720",
	"1920 x 1080",
	"2560 x 1440"
];

my_window = new window_popup(400,160,"Graphic Settings",4);
my_window.change_anchor_config(6,6,my_window.x, my_window.y);

var _a = my_window.ac_points;

fs_checkbox = new check_box( _a[1,4].x, _a[3,4].y, "Fullscreen");
fs_checkbox.checked = FULL_SCREEN;

sb_reso = new scroll_bar(_a[1,1].x, _a[1,1].y, supported_resolutions, 4);
sb_reso.selected_index = global.RES_INDEX;

music_slider 	= new slider_bar(_a[1,2].x,  _a[1,2].y, "Music Volume");
sfx_slider 		= new slider_bar(_a[1,3].x,  _a[1,3].y, "Sound Effects Volume");

ok_btn = new basic_button(_a[3,5].x,  _a[3,5].y, 100, 20, 0, "OK");

prev_mouse_y = mouse_y;
