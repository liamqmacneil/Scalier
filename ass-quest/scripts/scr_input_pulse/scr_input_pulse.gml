///@args input string of vk
for (var i = 0; i < argument_count; i++) {
	var arg = argument[i];
	if (is_string(arg)) {
		if (keyboard_check_pressed(ord(arg))) {
			return true;
		}
	}else {
		if (keyboard_check_pressed(arg)) {
			return true;
		}
	}
}

return false