/// @description ?
if(done == 0){
	//gravity
	vsp = vsp + grv;

	if(place_meeting(x + hsp, y, obj_wall))
	{
		
		
		while(!place_meeting(x + sign(hsp), y, obj_wall)) 
		{
			x = x + sign(hsp);
		}

		hsp = 0;
	}


	x = x + hsp; 
	if(place_meeting(x, y + vsp, obj_wall)) 
	{
		//if we are moving down, the loop below will continue, bringing our body to the floor
		//but the rest of the code will never run again
		if(vsp > 0) 
		{
			done = 1;
			//set the sprite to equal the dead sprite
			image_index = 1;
			//instance_create_layer(x-200,y-100,"GUI",obj_u_ded);
		}
		
		while(!place_meeting(x, y + sign(vsp), obj_wall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;

}