shader_type canvas_item;

uniform float WIDTH = 540.0;
uniform float HEIGHT = 414.0;

uniform sampler2D SCREEN_TEWIDTHTURE: hint_screen_texture;

void fragment()
{
	float _uv_x = SCREEN_UV.x * WIDTH;
	int new_uv_x = int(_uv_x);
	float _uv_y = SCREEN_UV.y * HEIGHT;
	int new_uv_y = int(_uv_y);
	vec2 new_uv = vec2(float(new_uv_x) / WIDTH, float(new_uv_y) / HEIGHT);
	
	COLOR = texture(SCREEN_TEWIDTHTURE, new_uv);
}
