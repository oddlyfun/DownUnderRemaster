

shader_set(shd_color_caf);
shader_set_uniform_f_array(uni_color,custom_color);
draw_self();
shader_reset();