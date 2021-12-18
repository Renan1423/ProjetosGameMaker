if(!collision_rectangle(x + 5,x + 26,y + 19,y + 28,obj_player,true,false)){
	image_speed = 0;
	image_index = 0;
}

if(!place_meeting(x,y+ grv + 11,obj_walls)){
	y += grv;
}

if(sound_delay < sound_maxDelay){
	sound_delay++;
}


//lock on animation

if(selected){
	frames++;
	if(frames >= maxFrames){
		frames = 0;
		index++;
		if(index > 2){
			index = 0;
		}
	}
}else{
	frames = 0;
	index = 0;
}