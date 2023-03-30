my_window.draw_me();
okay_btn.draw_me();

//my_window.draw_ac_points();


var _anchor = my_window.ac_points;


wrapper_01.x = _anchor[1,1].x;
wrapper_01.y = _anchor[1,1].y;
wrapper_01.write_out_pages();

wrapper_02.x = _anchor[1,4].x;
wrapper_02.y = _anchor[1,4].y;
wrapper_02.write_out_pages();


wrapper_03.x = _anchor[1,6].x;
wrapper_03.y = _anchor[1,6].y;
wrapper_03.write_out_pages();