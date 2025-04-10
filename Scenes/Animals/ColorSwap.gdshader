shader_type canvas_item;

uniform vec4 border: source_color;
uniform vec4 primary_color: source_color;
uniform vec4 secondary_color: source_color;
uniform vec4 eye_color: source_color;
uniform vec4 mouth_color: source_color;

uniform vec4 replace_border: source_color;
uniform vec4 replace_primary_color: source_color;
uniform vec4 replace_secondary_color: source_color;
uniform vec4 replace_eye_color: source_color;
uniform vec4 replace_mouth_color: source_color;

const float precision = 0.1;

vec4 replace_color(vec4 color) {
	vec4 original_colors[5] = vec4[5](border, primary_color, secondary_color, eye_color, mouth_color);
	vec4 replace_colors[5] = vec4[5](replace_border, replace_primary_color, replace_secondary_color, replace_eye_color, replace_mouth_color);

	for(int i = 0; i < original_colors.length(); i++) {
		if(distance(color, original_colors[i]) <= 0.01) {
			color = replace_colors[i];
		}
	}
	return color;
}
void fragment() {
	COLOR = replace_color(texture(TEXTURE, UV));
}