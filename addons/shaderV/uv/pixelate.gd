tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeUVpixelate

func _get_name() -> String:
	return "PixelateUV"

func _get_category() -> String:
	return "UV"

#func _get_subcategory():
#	return ""

func _get_description() -> String:
	return "Pixelate UV by effect factor"

func _get_return_icon_type() -> int:
	return VisualShaderNode.PORT_TYPE_VECTOR

func _get_input_port_count() -> int:
	return 2

func _get_input_port_name(port: int):
	match port:
		0:
			return "uv"
		1:
			return "factor"

func _get_input_port_type(port: int):
	set_input_port_default_value(1, 1.0)
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_VECTOR
		1:
			return VisualShaderNode.PORT_TYPE_SCALAR

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "uv"

func _get_output_port_type(port: int) -> int:
	return VisualShaderNode.PORT_TYPE_VECTOR

func _get_global_code(mode: int) -> String:
	return """
vec2 pixelateFunc(vec2 _uv_p1xelate, float _effect_factor_p1xelate){
	return round(_uv_p1xelate / max(_effect_factor_p1xelate * 0.01, 0.001)) * max(_effect_factor_p1xelate * 0.01, 0.001);
}
"""

func _get_code(input_vars: Array, output_vars: Array, mode: int, type: int) -> String:
	return "%s.xy = pixelateFunc(%s.xy, %s);" % [output_vars[0], input_vars[0], input_vars[1]]
