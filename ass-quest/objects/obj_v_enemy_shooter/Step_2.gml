/// @description ? Rotate the cannon to the player
with(obj_b_player) 
{
    other.image_angle = point_direction(other.x,other.y,x,y);
    
    if(other.image_angle >= 210) && (other.image_angle < 270) other.image_angle = 210;
    
    if(other.image_angle < 340) && (other.image_angle >= 270) other.image_angle = 340;
    
    
    
}
if(image_angle > 90) && (image_angle < 270)
{
    image_yscale = -1; //gun gets flipped
}
else 
{
    image_yscale = 1;
}
fireDelay = fireDelay - 1;
//if the player is in proximity

if(!instance_exists(obj_b_player)) exit;

if(obj_b_player.x > (x - 300)) && (obj_b_player.x < (x + 300))
{
    //fire at the bitch
    if(fireDelay < 0) 
    {
        
        //screenShake(6,20);
        //two seconds between the shots
        fireDelay = 120;
        var iid = instance_create_layer(x+lengthdir_x(sprite_width,image_angle),y+lengthdir_y(sprite_width,image_angle),"bullet_layer",obj_enemy_projectile)
        iid.speed = 15
        iid.direction = image_angle
        iid.image_angle = iid.direction
        
    }
}