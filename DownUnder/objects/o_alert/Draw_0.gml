
if ( bck_c == c_orange )
{
	bck_c = c_red;
} else
{
	bck_c = c_orange;
}

draw_text_ext_transformed_color(x+1,y+1,"!",0,100, 4, y_scale, 0, bck_c, bck_c, bck_c, bck_c, 1);