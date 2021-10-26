direction = point_direction(x,y,mouse_x,mouse_y);

var _dist = floor(distance_to_point(mouse_x,mouse_y));


if ( _dist <= max_speed ){
	speed = 0;
} else
{
	speed = max_speed;
}



//var _view_x = camera_get_view_x(global.main_camera);
//var _view_y = camera_get_view_y(global.main_camera);
//var _view_w = camera_get_view_width(global.main_camera);
//var _view_h = camera_get_view_height(global.main_camera);


