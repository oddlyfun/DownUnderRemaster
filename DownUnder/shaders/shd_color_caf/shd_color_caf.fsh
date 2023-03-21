//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float red = (col.r + col.g + col.b) / 3.0;
	float green = red;
	float blue = red;
	
	vec3 add_color = ( vec3(0.0, 1.0, 1.0) + vec3(red,green,blue) ) / 2.0;
	
	col = vec4(add_color.r, add_color.g, add_color.b, col.a);
	
	
    gl_FragColor = col;
}
