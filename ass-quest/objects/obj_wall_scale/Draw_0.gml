if (finished = false) {
	if (surface_exists(obj_scalier.scaleSurf)) {
		surface_set_target(obj_scalier.scaleSurf)
			draw_self();
			finished = true;
		surface_reset_target()
	}
}

if (finishedTest = false) {
	if (obj_scalier.deactive = true) {
		if (point_in_rectangle(x+(sprite_width/2),y+(sprite_height/2),obj_scalier.scalePos0_x,obj_scalier.scalePos0_y,obj_scalier.scalePos1_x,obj_scalier.scalePos1_y)) {
			instance_deactivate_object(id);
		}else {
			finishedTest = true;
		}
	}
}