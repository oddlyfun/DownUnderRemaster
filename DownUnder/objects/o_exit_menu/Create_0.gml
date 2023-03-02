show_display = false;


my_window = new window_popup( 
	camera_get_view_width(view_camera[0]) * 0.50,
	camera_get_view_height(view_camera[0]) * 0.50,
	"Exit",
	6,
	true
	);
	

play_btn = new basic_button(0,0,100,40,0,"Back to Playing"); 
exit_btn = new basic_button(0,0,100,40,0,"Main Menu");