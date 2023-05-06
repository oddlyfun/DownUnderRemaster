varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 _custom_color;

void main()
{
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	col = vec4(1.0, 0.0, 0.0, col.a);	
    gl_FragColor = col;
}