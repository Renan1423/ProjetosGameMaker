if(place_free(x,y+grvt)){
	y+=4;
}

if(dir == 1){
	if(place_free(x+spd,y) && place_meeting(x + 16, y + grvt,obj_Wall)){
		x+=spd;
	}else{
		dir*= -1;
		image_xscale = -1;
	}
}

if(dir == -1){
	if(place_free(x-spd,y) && place_meeting(x - 16, y + grvt,obj_Wall)){
		x-=spd;
	}else{
		dir*= -1;
		image_xscale = 1;
	}
}

var collision = place_meeting(x,y,obj_Bullet);
if(collision){
	with(collision)instance_destroy();
	life--;
	if(life <= 0){
		instance_destroy();
	}
}