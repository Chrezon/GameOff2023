// canvas_item = 2D apparently
shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform vec3 offsets = vec3(0.009, 0.006, -0.006);

void fragment() {
	vec2 uv = SCREEN_UV;
	
	COLOR.r = texture(screen_texture, uv + vec2(offsets.r, 0)).r;
	COLOR.g = texture(screen_texture, uv + vec2(offsets.g, 0)).g;
	COLOR.b = texture(screen_texture, uv + vec2(offsets.b, 0)).b;	
}