frame = 0;


view_width = 640; // (/4 = 480)		( /3 = 640 )
view_height = 360; // (/4 = 270)	( /3 = 360 )
window_scale = window_scale // window size will be 960 x 540

display_set_gui_size(640,360);  // The GUI fits the real window size not scaled up from the view size


global.main_camera = camera_create_view(0,0,view_width,view_height);
// 

camera_set_view_size(global.main_camera,view_width,view_height);

var _i = 0;

while( room_exists(_i) )
{
	room_set_view_enabled(_i,true);
	room_set_viewport(_i,0,true,0,0,view_width,view_height);
	room_set_camera(_i,0,global.main_camera);
	_i++;
}
//show_debug_message("\nNumber of rooms: "+string(_i) );


surface_resize(application_surface,view_width,view_height);


window_set_size(view_width*2,view_height*2);
alarm[0]=1;

room_goto(ro_game);