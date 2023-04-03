
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

fs_checkbox = new check_box( _a[3,1].x, _a[3,1].y, "Fullscreen");
fs_checkbox.checked = FULL_SCREEN;

sb_reso = new scroll_bar(_a[1,1].x, _a[1,1].x, supported_resolutions, 4);
sb_reso.selected_index = global.RES_INDEX;

music_slider 	= new slider_bar(_a[1,2].x,  _a[1,2].y);
sfx_slider 		= new slider_bar(_a[1,3].x,  _a[1,3].y);

ok_btn = new basic_button(_a[2,5].x,  _a[2,5].y);
