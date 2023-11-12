// Note: This doesn't look right in the viewport because
// SCREEN_UV considers the entire viewport as a screen.
// When running a scene it works fine. 

// canvas_item = 2D apparently
shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform float size = 0.008;

void fragment() {
	vec2 uv = SCREEN_UV;
	vec2 pixelSize = size * vec2(1, SCREEN_PIXEL_SIZE.y/SCREEN_PIXEL_SIZE.x);
	uv -= mod(uv, pixelSize) - 0.5 * pixelSize;
	COLOR.rgb = textureLod(screen_texture, uv, 0.0).rgb;
}