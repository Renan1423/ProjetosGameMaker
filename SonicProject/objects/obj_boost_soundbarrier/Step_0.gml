if(obj_player.isBoosting = false){
	obj_player.boostCount = 0;
	instance_destroy();
}

x = obj_player.x;
y = obj_player.y;

image_angle = obj_player.angle;
image_xscale = -(obj_player.xdir);

