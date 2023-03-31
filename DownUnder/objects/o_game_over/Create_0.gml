first_keypress = false;

click_ok = new basic_button(0,0,60,20,0,"OK");

keyboard_string = default_text;


var _cam = view_camera[0];
var _w = camera_get_view_width(_cam);
var _h = camera_get_view_height(_cam);

my_x = _w / 2 - (sprite_width / 2);
my_y = _h / 2  - (sprite_height) - 20;
