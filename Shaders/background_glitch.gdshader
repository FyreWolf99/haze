shader_type canvas_item;

vec4 swirl(vec2 uv, float size, int arms, vec4 col_rgb)
{
	float angle = atan(-uv.y + 0.5, uv.x - 0.5) ;
	float len = length(uv - vec2(0.5, 0.5));
	
	float swirl_amt = sin(len * size + angle * float(arms) + TIME);
	
	return vec4(col_rgb * swirl_amt);
}

void fragment()
{
	COLOR = vec4(1, 1, 1, 1) / swirl(UV, 18.0, 3, COLOR);
}