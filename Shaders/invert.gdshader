shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture;

void fragment()
{
	COLOR.rgb = vec3(1, 1, 1);
	vec4 scr_col = texture(SCREEN_TEXTURE, SCREEN_UV);
	COLOR.rgb = vec3(1, 1, 1);
	
	COLOR.r = 1.0 - scr_col.r;
	COLOR.g = 1.0 - scr_col.g;
	COLOR.b = 1.0 - scr_col.b;
}
