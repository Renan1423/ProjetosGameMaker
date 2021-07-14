if(keyboard_check(vk_right) && place_free(x+playerspeed,y)){
	x+=playerspeed;
	image_xscale = 1;
}
else if(keyboard_check(vk_left) && place_free(x-playerspeed,y)){
	x-=playerspeed;
	image_xscale = -1;
}

if(keyboard_check(ord("X"))){
	if(!place_free(x,y+1)){
		jump = true;
	}
}
if(jump){
	if(jumpFrames < jumpHeight){
		jumpFrames += jumpSpd;
		if(place_free(x,y-jumpSpd)){
			y-=jumpSpd;
		}else{
			jump = false;
			jumpFrames = 0;
		}
	}else{
		jump = false;
		jumpFrames = 0;
	}
}

if(jump == false){
	if(place_free(x,y+spdFall)){
		y+=spdFall;
		spdFall+=grvt;
		if(spdFall >= maxSpdFall){
			spdFall = maxSpdFall;
		}
	}else{
		spdFall = 2;
	}
}
while(!place_free(x,y+spdFall) && place_free(x,y+1)){
	y+=1;
}

if(keyboard_check_pressed(ord("Z"))){
	var obj = instance_create_depth(x,y,-10, obj_Bullet);
	obj.dir = image_xscale;
}

if(place_meeting(x,y,obj_Enemy)){
	life--;
	if(life <= 0){
		room_restart();
	}
}

