var oldCol = draw_get_color()
draw_set_color(c_black)

if (mouse_wheel_up()) {
	scaleAm ++;
	scalePoint0_x = scalePoint0_x_d-((scaleAm-1)*10);
	scalePoint0_y = scalePoint0_y_d-((scaleAm-1)*10);
	scalePoint1_x = scalePoint1_x_d+((scaleAm-1)*10);
	scalePoint1_y = scalePoint1_y_d+((scaleAm-1)*10);
	show_debug_message(scaleAm)
}

if (mouse_wheel_down()) {
	scaleAm --;
	scalePoint0_x = scalePoint0_x_d-((scaleAm-1)*10);
	scalePoint0_y = scalePoint0_y_d-((scaleAm-1)*10);
	scalePoint1_x = scalePoint1_x_d+((scaleAm-1)*10);
	scalePoint1_y = scalePoint1_y_d+((scaleAm-1)*10);
	show_debug_message(scaleAm)
}

#region
	if (mouse_check_button_pressed(mb_right)) {
		scaling = false;
		scalePoint0_x = noone;
		scalePoint0_y = noone;

		scalePoint1_x = noone;
		scalePoint1_y = noone;
		
		scalePointState = 0;
	}
#endregion



switch (scalePointState) {
	
	case 0:
		if (mouse_check_button_pressed(mb_left)) {
			scalePointState = 1;
			scalePoint0_x_d = obj_mouse.x;
			scalePoint0_y_d = obj_mouse.y;
			scaling = true;
		}
	break;
	
	case 1:
		draw_rectangle(scalePoint0_x_d,scalePoint0_y_d,obj_mouse.x,obj_mouse.y,true);
		if (mouse_check_button_pressed(mb_left)) {
			scalePointState = 2;
			scalePoint1_x_d = obj_mouse.x;
			scalePoint1_y_d = obj_mouse.y;
		}
	break;
	
	case 2:
		scalePoint0_x = scalePoint0_x_d-((scaleAm-1)*10);
		scalePoint0_y = scalePoint0_y_d-((scaleAm-1)*10);
		scalePoint1_x = scalePoint1_x_d+((scaleAm-1)*10);
		scalePoint1_y = scalePoint1_y_d+((scaleAm-1)*10);
		draw_rectangle(scalePoint0_x,scalePoint0_y,scalePoint1_x,scalePoint1_y,true);
		if (instance_exists(obj_wall_scale)) {
			obj_wall_scale.scaleSelectTest = true;
		}
		scaling = false;
		scalePointState = 3;
	break;

	case 3:
		draw_rectangle(scalePoint0_x,scalePoint0_y,scalePoint1_x,scalePoint1_y,true);
	break;
}


draw_set_color(oldCol)











