show_display = false;


my_window = new window_popup( 
	camera_get_view_width(view_camera[0]) * 0.40,
	camera_get_view_height(view_camera[0]) * 0.30,
	"Exit Game?",
	6,
	true
	);
	

var _anchor_5 = my_window.ac_points[0][5];
var _anchor_6 = my_window.ac_points[0][6];

var _but_width = 160;
var _total_but_width ( _but_width * 2) + 20;

var _but_height = 40;

var _x_but = _anchor_5.x + ((my_window.width / 2) - (_total_but_width / 2));
var _y_but = _anchor_5.y - ((_but_height / 2));


play_btn = new basic_button(_x_but,_y_but,_but_width,_but_height,0,"Resume"); 
exit_btn = new basic_button(_x_but + _but_width + 20,
	_y_but,_but_width,_but_height,0,"Main Menu");
