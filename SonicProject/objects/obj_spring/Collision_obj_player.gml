
	if(obj_player.isStomping){
		obj_player.isStomping = false;
		obj_player.vsp = 0;
	}
	
	if(sound_delay >= sound_maxDelay){
		audio_play_sound(s_Spring,1000,false);
		sound_delay = 0;
	}
	
	//On the ground	
	
	if((image_angle = 90 || image_angle = -90) && obj_player.ground){
		obj_player.xdir = obj_player.xdir * -1;
		image_speed = 12;
		if(obj_player.xdir > 0){
			obj_player.hsp = (jumpForce - 2) * asin * -obj_player.xdir;
		}else{
			obj_player.hsp = (jumpForce - 2) * asin * obj_player.xdir;
		}
	}
	
	//In the air

	if(!obj_player.ground){
		obj_player.hsp = (jumpForce - 2) * asin;
		obj_player.vsp -= jumpForce * acos;
		image_speed = 12;
	}

	if((image_angle != 90 || image_angle != -90) && obj_player.ground){
		if(image_angle = 45){
			obj_player.vsp += obj_player.sjmp;
			obj_player.xdir = obj_player.xdir * -1;
			image_speed = 12;
			if(obj_player.xdir > 0){
				obj_player.hsp = (jumpForce - 2) * asin * -obj_player.xdir;
			}else{
				obj_player.hsp = (jumpForce - 2) * asin * obj_player.xdir;
			}
			obj_player.isSpringing = true;
			
			if(obj_player.isBoosting){
				obj_player.isBoosting = false;
			}
		}
		
		if(image_angle = 0){
			obj_player.vsp += obj_player.sjmp;
			image_speed = 12;
			if(obj_player.xdir > 0){
				obj_player.hsp = (jumpForce - 2) * asin * -obj_player.xdir;
			}else{
				obj_player.hsp = (jumpForce - 2) * asin * obj_player.xdir;
			}
			obj_player.isSpringing = true;
			
			if(obj_player.isBoosting){
				obj_player.isBoosting = false;
				obj_player.hsp = 0;
			}
		}
	}
	
	if(asin != 0 && !obj_player.ground){
		image_speed = 12;
		if(obj_player.xdir > 0){
			obj_player.hsp = (jumpForce - 2) * asin * -obj_player.xdir;
		}else{
			obj_player.hsp = (jumpForce - 2) * asin * obj_player.xdir;
		}
	}