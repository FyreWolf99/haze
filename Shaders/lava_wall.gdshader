shader_type canvas_item;

uniform sampler2D noise_tex;
uniform float saturation;
uniform float len: hint_range(0.0, 1.0, 0.1);

float curve(float uvx, float time)
{
	float output;
	if (uvx < (0.1 + 0.1 * len))
	{
		output = 1.0;
	}
	else
	{
		output = 3.0 - uvx * (20.0 - (10.0 * len));
	}
	
	return output - abs(sin(time)) / 2.0;
}

void fragment()
{
	float new_a = curve(UV.x, TIME);
	COLOR.a = new_a * texture(noise_tex, UV).r;
	
	vec4 tex_color = texture(TEXTURE, UV);
	
	COLOR.rgb = mix(vec3(dot(tex_color.rgb, vec3(0.299, 0.587, 0.114))), tex_color.rgb, saturation);
}