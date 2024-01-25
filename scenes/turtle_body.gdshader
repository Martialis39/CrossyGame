shader_type canvas_item;

uniform sampler2D mask_image;
uniform float range: hint_range(0.0, 1.0, 0.1) = 0;

void fragment() {
	vec4 mask = texture(mask_image, UV);
	vec4 color = texture(TEXTURE, UV);
	COLOR = color;
	if (mask.a < range){
		COLOR.a = 0.;
	}
}
