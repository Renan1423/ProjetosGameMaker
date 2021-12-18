


if(isCooldown){
	if(cooldownTransparent = 0){
		draw_sprite_ext(sprp,image_i,x,y,-xdir,1,angle,c_white,0.2);
	}else{
		draw_sprite_ext(sprp,image_i,x,y,-xdir,1,angle,c_white,1);
	}
	
	cooldownCount++;
	if(cooldownCount >= cooldownMaxCount){
		cooldownCount = 0;
		if(cooldownTransparent = 0){
			cooldownTransparent = 1;
		}else{
			cooldownTransparent = 0;
		}
	}
}else{
	draw_sprite_ext(sprp,image_i,x,y,-xdir,1,angle,c_white,1);
}

if(image_i > 998){
	image_i = 0;
}

if(frame>=1){
	frame = 0;
	if(action != -1 && action != -3 && action != -5 && action != -6){
		image_i += 1;
	}else if(action = -1){
		image_i += 1;
		if(image_i >= 4){
			image_i = 4;
		}
	}else if(action = -3){
		image_i += 1;
		if(image_i >= 1){
			image_i = 1;
		}
	}else if(action = -5 || isTakingDamage){
		image_i += 1;
		if(image_i >= 4){
			image_i = 4;
		}
	}else if(action = -6 || isDead){
		image_i += 1;
		if(image_i >= 4){
			image_i = 4;
		}
	}
}

//standing
if(!isTakingDamage && !isDead){
	if(hsp = 0 && ground && action = 0){
		sprp = spr_sonic_idle;
		frame+= 1/max(8-(xdir * hsp),1);
		last_action = 0;
	}
	//walking and running

	if((hsp!=0 || !ground) && action = 0 && action != -5 && !isOnBar){
		if(last_action = 0){
			image_i = 0;
		}
		last_action = 1;
		//frame+= 1/max(13-(xdir * hsp),1);
	
		if(abs(hsp) < 3){
			sprp = spr_sonic_walk;
			frame+= 1/max(13-(xdir * hsp),1);
		}
		if(abs(hsp) >= 3 && abs(hsp) < 6){
			sprp = spr_sonic_walk2;
			frame+= 1/max(13-(xdir * hsp),1);
		}
		if(abs(hsp) >= 6 && abs(hsp) < 9){
			sprp = spr_sonic_run;
			frame+= 1/max(13-(xdir * hsp),1);
		}
		if(abs(hsp) >= 9 && abs(hsp) < 13){
			sprp = spr_sonic_run2;
			frame+= 1/max(14-(xdir * hsp),1);
		}
		if(abs(hsp) >= 13){
			sprp = spr_sonic_run3;
			frame+= 1/max(16-(xdir * hsp),1);
		}
	}

	//jump roll

	if(action = 2){
		frame+= 1/max(4-(xdir * hsp),1);
		sprp = spr_sonic_roll;
	}

	if(action = 1){
		frame+= 1/max(4-(xdir * hsp),1);
		sprp = spr_sonic_jump;
	}

	/*if(action = 5){
		frame+= 1/max(4-(xdir * hsp),1);
		last_action = 5;
		sprp = spr_sonic_afterAttack;
	}*/

	//ducking
	if(action = -1){
		if(last_action = 0){
			image_i = 0;
			last_action = -1;
		}
		sprp = spr_sonic_look_down;
		frame+= 1/max(4-(xdir * hsp),1);
	}

	//looking up

	if(action = -3){
		if(last_action = 0){
			image_i = 0;
			last_action = -3;
		}
		sprp = spr_sonic_look_up;
		frame+= 1/max(8-(xdir * hsp),1);
	}

	//peel out

	if(action = -4){
		frame += 0.5;
		if (spot >= 17){
			sprp = spr_sonic_run;
		}
		if(spot >= 5 && spot < 17){
			sprp = spr_sonic_run2;
		}
		if(spot < 5) {
			sprp = spr_sonic_run3;
		}
	}

	//spin dash

	if action = -2
	{
		frame += 0.5;
		if(key_a){
			sprp = spr_sonic_spindash_charge;
			var Dust = instance_create_depth(x + (36 * -xdir),y,-1,obj_dust);
			audio_play_sound(s_SpinDash,1000,false);
			isCharging = true;
			if(image_i >= 4){
				image_i = 0;
				isCharging = false;
			}
		}else if (!key_a && isCharging = false){
			sprp = spr_sonic_spindash;
		}
	}
	
	//boost

	if(isBoosting){
		sprp = spr_sonic_boost;
	}

	//stomp

	if(isStomping && !ground){
		sprp = spr_sonic_stomp;
	}
	
	//spring jump
	
	if(isSpringing){
		if(vsp >= 0){
			sprp = spr_sonic_stomp;
		}else{
			sprp = spr_sonic_spring;
		}
	}
	
	//On bar
	
	if(isOnBar && ground){
		sprp = spr_sonic_skate;
	}
	
	
}else if(isTakingDamage){

	//taking damage

	if(action = -5){
		if(last_action = 0 || last_action = 1 || last_action = 2){
			image_i = 0;
			last_action = -5;
		}
		sprp = spr_sonic_damage;
		frame+= 1/max(6-(xdir * hsp),1);
	}
	
	if(ground && vsp >= 0){
		action = 0;
		isCooldown = true;
		isTakingDamage = false;
	}
	
}else if(isDead){
	sprp = spr_sonic_dead;
	frame+= 1/max(8-(xdir * hsp),1);
}



