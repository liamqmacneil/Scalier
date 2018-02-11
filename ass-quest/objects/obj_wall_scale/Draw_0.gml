if (surface_exists(obj_scalier.scaleSurf)) {
	surface_set_target(obj_scalier.scaleSurf)
		draw_self();
	surface_reset_target()
}