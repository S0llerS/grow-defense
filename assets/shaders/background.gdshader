shader_type canvas_item;

uniform float scale = 1.0;
uniform vec4 tint_color : source_color;

void fragment() {
	COLOR = texture(TEXTURE, UV * vec2(scale, scale) + TIME * vec2(-0.5, -0.6) * 0.75);
	COLOR = mix(COLOR, tint_color, 0.5); 
}