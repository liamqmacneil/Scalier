if (surface_exists(scaleSurf)) {
	surface_free(scaleSurf);
}

if (surface_exists(scaleDisplaySurf)) {
	surface_free(scaleDisplaySurf);
}

if (sprite_exists(spr_wallMask)) {
	sprite_delete(spr_wallMask);
}

if (sprite_exists(spr_scaleMask)) {
	sprite_delete(spr_scaleMask);
}
