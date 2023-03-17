frame = 0;

cam_vel = 0;
cam_vel_y = 0;

view_width = 640; 
view_height = 360;

window_width = 640*2;
window_height = 360*2;

pad_x = 160;
pad_y = 120;

display_set_gui_size(640,360);  

global.main_camera = camera_create_view(0,0,view_width,view_height);

var _i = 0;
while( room_exists(_i) )
{
	room_set_view_enabled(_i,true);
	room_set_viewport(_i,0,true,0,0,view_width,view_height);
	room_set_camera(_i,0,global.main_camera);
	_i++;
}

surface_resize(application_surface,view_width,view_height);

window_set_size(window_width,window_height);

alarm[0]=1;

//room_goto(ro_start_screen);
room_goto(ro_test);
