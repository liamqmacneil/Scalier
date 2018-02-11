var oldCol = draw_get_color()
draw_set_color(c_white);
if !(surface_exists(scaleSurf)) {
	scaleSurf = surface_create(room_width,room_height);
}

if (mouse_check_button_pressed(mb_right)) {
	scaleCase = 0;
	surface_set_target(scaleDisplaySurf)
		
	surface_reset_target()
}

switch (scaleCase) {
	case 0:
		if (mouse_check_button_pressed(mb_left)) {
			scaling = true;
			scalePos0_x = obj_mouse.x;
			scalePos0_y = obj_mouse.y;
			scaleCase = 1;
		}
	break;
	
	case 1:
		draw_rectangle(scalePos0_x,scalePos0_y,obj_mouse.x,obj_mouse.y,true);
		if (mouse_check_button_pressed(mb_left)) {
			scaling = true;
			scalePos1_x = obj_mouse.x;
			scalePos1_y = obj_mouse.y;
			scaleSel_h = scalePos1_x-scalePos0_x;
			scaleSel_w = scalePos1_y-scalePos0_y;
			scaleCase = 2;
		}
	break;
	
	case 2:
		draw_rectangle(scalePos0_x,scalePos0_y,scalePos1_x,scalePos1_y,true);
		if !(surface_exists(scaleDisplaySurf)) {
			scaleDisplaySurf = surface_create(scaleSel_h,scaleSel_w)
		}
		surface_copy_part(scaleDisplaySurf,0,0,scaleSurf,scalePos0_x,scalePos0_y,scaleSel_w,scaleSel_h);
		draw_surface_ext(scaleDisplaySurf,scalePos0_x,scalePos0_y,1,1,2,c_yellow,1);
	break;
}






draw_surface(scaleSurf,0,0);
surface_set_target(scaleSurf);
	draw_clear_alpha(c_black,0);
surface_reset_target()










draw_set_color(oldCol);