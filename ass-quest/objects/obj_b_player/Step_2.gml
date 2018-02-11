/// @description ?
hitdelay--;

if(healthPrevious > hp) {
	hitdelay = 5;
	//vsp -= 2;
}

if(hitdelay > 0) {
	sprite_index = spr_ben_player_hit;
} else {
	sprite_index = spr_b_player;
}

if(hp <= 0) {
	
	//show_debug_message(hp);
	
	with(instance_create_layer(x,y,"player_layer",obj_b_player_dead)) {
		
		direction = other.hitfrom;
		
		//this is used to provide movement in a certain direction
		//direction is an angle, so what lenght_dir does is the math 
		//on how far the movement is with 3 blocks on the x axis
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction)-2;
		
		//this changes which way the enemy is facing when it gets shot
		
		if(sign(hsp) != 0) image_xscale = sign(hsp);

	}
	
	instance_destroy();
}


healthPrevious = hp;