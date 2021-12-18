function p_move(){
	//controls
	
	key_r = keyboard_check(vk_right);
	key_l = keyboard_check(vk_left);
	key_a = keyboard_check_pressed(ord("Z")); //jump
	key_ar = keyboard_check_released(ord("Z")); //release jump
	
	key_boost = keyboard_check_pressed(ord("A")); //boost
	key_stopBoost = keyboard_check_released(ord("A")); //stop boost
	
	key_d = keyboard_check(vk_down);
	key_u = keyboard_check(vk_up);
	
	key_stomp = keyboard_check_pressed(ord("X")); //stomp
	key_stompFloor = keyboard_check(ord("X"));
	key_stopStomp = keyboard_check_pressed(ord("X")); //stop stomp
	
	//direction
	
	if(action = 0){
		if (key_l && !isBoosting && !isStomping && !isHomingAttacking && !isOnBar){
			xdir = -1;
		}
		if (key_r && !isBoosting && !isStomping && !isHomingAttacking && !isOnBar){
			xdir = 1;
		}
	}
	
	if(!isTakingDamage && !isDead){
	
		//player movement
	
		if((action = 0 || action = 1)){
			if(ground){
				if (key_r && !isBoosting && !isStomping && !isHomingAttacking && !isOnBar)
				{if hsp >= 0 {if hsp < hspm{hsp += acc}}else hsp+=dcc; }
				if (key_l && !isBoosting && !isStomping && !isHomingAttacking && !isOnBar)
				{if hsp <= 0 {if hsp > -hspm{hsp -= acc}} else hsp-=dcc;}
				if !key_r && !key_l
				{if hsp > 0 hsp-=frc; if hsp < 0 hsp += frc; if hsp <= frc && hsp >= -frc hsp = 0;}
			}
			else{
				if (key_r && !isBoosting && !isStomping && !isHomingAttacking && !isOnBar)
				{if hsp >= 0 {if hsp < hspm hsp += acc*2}}
				if (key_l && !isBoosting && !isStomping && !isHomingAttacking && !isOnBar)
				{if hsp <= 0 {if hsp > -hspm hsp -= acc*2}}
				if !key_r && !key_l
				{if hsp > 0 hsp-=frc; if hsp < 0 hsp+=frc; if hsp <= frc && hsp >= -frc hsp = 0;}
			}
		}
	
		if(action = 2 && !isOnBar){
			if(ground){
				if(hsp > bfr){
					hsp -= bfr;
					if(key_l){
						hsp-=bdcc;
					}
				}
				if(hsp < -bfr){
					hsp += bfr;
					if(key_r){
						hsp += bdcc;
					}
				}
			
				if(hsp < bfr && hsp > -bfr){
					hsp = 0;
				}
			}
			else{
				if(key_r){
					if(hsp >= 0){
						if (hsp < hspm) {
							hsp += acc * 2;
						}
					}
				}
	
				if(key_l){
					if(hsp <= 0){
						if(hsp > -hspm){
							hsp -= acc * 2;
						}
					}
				}
			}
		}
	
	
		//jumping
	
		/*if(key_a && ground && (action = 0 || action = 2)){
			ground = 0;
			vsp = acos*jmp;
			hsp = asin*jmp;
			angle = 0;
			acos = 1;
			asin = 0;
			action = 1;
		}*/
	
		if key_a && ground && (action = 0 || action = 2) && action != 5 && !isHomingAttacking && !place_meeting(x,y,obj_spring)
		{
			ground = 0;
			vsp = acos * jmp - asin * hsp;
			hsp = acos * hsp + asin * jmp;
			angle = 0;
			acos=1;
			asin=0;
			action = 1;
			
			audio_play_sound(s_Jump,1000,false);
			
			var Random = random_range(0,100);
			if(Random <= 50){
				audio_play_sound(s_JumpSonic,1000,false);
			}else{
				audio_play_sound(s_JumpSonic2,1000,false);
			}
		}
	
		//small jump
	
		if(key_ar && vsp < sjmp && action = 1 && !isHomingAttacking && !place_meeting(x,y,obj_spring)){
			vsp = sjmp;
		}
	
		if((key_ar || key_a) && !place_free(x,y-16)){
			vsp = 1;
		}
	
		//air drag
	
		if(vsp < 0 && vsp > -4){
			if(abs(hsp) >= 0.125){
				hsp = hsp*adrag;
			}
		}
	
		//landing
	
		if(ground && (action = 1 || action = -5 || isSpringing)){
			action = 0;
			isHomingAttacking = false;
			HomingAttackCooldown = false;
			targets[0] = noone;
			isSpringing = false;
			if(isStomping){
				audio_play_sound(s_StompOnFloor,1000,false);
				var BoostShockWave = instance_create_depth(x,y,-1,obj_boost_shockwave);
				//isStomping = false;
			}
		}
	
		//rolling ducking
		
		if(key_d && ground && action = 0){
			if(abs(hsp) < 1.02125){
				hsp = 0;
				action = -1;
			}
		
			if(abs(hsp) >= 1.02125 && !isBoosting && !isOnBar){
				audio_play_sound(s_SpinDash,1000,false);
				action = 2;
			}
		}
	
		if(action = -1 && !key_d && action != -5){ //un duck
			action = 0;
		}
	
		if(action = 2 && abs(hsp) < 0.5 && ground && action != -5){ //unroll
			action = 0;
		}
	
		if(action = 2 && vsp > 0 && !ground && collision_script_ground(16) && action != -5){ //un roll on ground
			action = 0;
		}
	
		//looking up
	
		if(key_u && ground && action = 0){
			if(abs(hsp) < 0.2){
				hsp = 0;
				action = -3;
			}
		}
	
		if((!key_u || !ground || key_r || key_l) && action = -3 && action != -5){
			action = 0;
		}
	
		//peel out
	
		if action = -3 && key_a action = -4;
		if action != -4 spot = 30;
	
		if action = -4{
			if key_ar{
				action = 0; if spot = 0 {hsp = xdir * 12;}
			}
			if spot != 0 spot -= 1;
		}
	
	
		//spin dash
	
		if sp > 0{
			sp = sp - ((sp div 1)/265)
		}
		if sp > 64{
			sp = 64;
		}
		if(action = -2 && key_a) {
			sp += 8;
		}
		if(action = -2 && !key_d){
			audio_play_sound(s_SpeedChute,1000,false);
			hsp = xdir*8+(xdir*floor(sp)/8);
			action = 2;
			sp = 0;
		}
		if(action = -1 && key_a){
			sp = 0;
			action = -2;
		}
	
		//boost
	
		if(key_boost && boostLevel >= 1 && !isStomping){
			isBoosting = true;
			isSpringing = false;
			var Random = random_range(0,200);
			if(Random <= 75){
				audio_play_sound(s_Boost,500,false);
			}else if(Random > 75 && Random < 150){
				audio_play_sound(s_HomingAttackTarget,2000,false);
			}else{
				audio_play_sound(s_HomingAttackTarget3,2000,false);
			}
		}else if(key_stopBoost && isBoosting){
			isBoosting = false;
			hsp = 14 * (xdir);
		}
	
		if(boostLevel <= 0){
			boostLevel = 0;
			hspl = 16;
			if(abs(hsp) > 16){
				hsp = 16 * xdir;
			}
		}
	
		if(isBoosting){
			hspl = splBoost;
			hsp = splBoost * (xdir);
			action = 1;
		}else{
			hspl = 16;
			if(abs(hsp) > hspl){
				hsp = hspl * (xdir);
			}
		}
	
		//Stomp
	
		if(key_stomp && !ground){
			audio_play_sound(s_Stomp,500,false);
			vsp = acos * spStomp - asin * hsp;
			hsp = 0;
			angle = 0;
			acos=1;
			asin=0;
			isStomping = true;
		}
	
		if((isStomping) && !ground){
			var BlueBlur = instance_create_depth(x - 16,y - 16,0,obj_blur);
		}
		if(isHomingAttacking && !ground){
			var BlueBlur = instance_create_depth(x - 16,y - 16,0,obj_blurHomingAttack);
		}
	
		if(key_stompFloor && ground && hsp = 0){
			action = -1;
			image_i = 4;
		}
	
		if(place_meeting(x,y+1,obj_walls) && isStomping && !ground){
			isStomping = false;
			x++;
		}
	
		//Homing Attack
	
		if(isHomingAttacking){
			grv = 0;
		}else{
			grv = startgrv;
		}
		
		if(HomingAttackCount < HomingAttackMaxCount){
			HomingAttackCount++;
		}else{
			HomingAttackCount = HomingAttackMaxCount;
		}
	
		if(!ground && action = 1 && key_a && targets[0] != noone && !isHomingAttacking && !isStomping && !isBoosting && !isSpringing && HomingAttackCount = HomingAttackMaxCount){
		
			isHomingAttaking = true;
			audio_play_sound(s_HomingAttack,500,false);
			var AfterImage = instance_create_depth(x,y,-1,obj_AfterImage);
			
			var Random = random_range(0,400);
				if(Random <= 100){
					audio_play_sound(s_HomingAttackTarget,1000,false);
				}else if(Random > 100 && Random <= 200){
					audio_play_sound(s_HomingAttackTarget2,1000,false);
				}else if(Random > 200 && Random <= 300){
					audio_play_sound(s_HomingAttackTarget3,1000,false);
				}else if(Random > 300 && Random <= 400){
					audio_play_sound(s_JumpSonic,1000,false);
				}
		
			if(x < targets[0].x && xdir = 1){
				//hsp = strikeXspeed;
				x = targets[0].x;
			}
			else if(x > targets[0].x && xdir = -1){
				//hsp = -strikeXspeed; 
				x = targets[0].x;
			}
		
			if(y < targets[0].y){
				y = targets[0].y;
			}else if(y > targets[0].y){
				y = targets[0].y; 
			}
		}
	
		if(!ground && action = 1 && angle = 0 && !collision_script_top(16) && key_a && targets[0] = noone && !isHomingAttacking && vsp > -5 && !isBoosting && !HomingAttackCooldown && !isOnBar){
			isHomingAttacking = true;
			audio_play_sound(s_HomingAttack,500,false);
			hsp = strikeXspeed * xdir;
			vsp = 0;
			alarm[0] = 10;
		}
		
		//On bar

		if((collision_script_bottomOnBar(16) || collision_script_groundOnBar(16) || collision_script_rightOnBar(16) || collision_script_leftOnBar(16) || collision_script_left_lineOnBar(16) || collision_script_right_lineOnBar(16))){
			isOnBar = true;
		}else{
			isOnBar = false;
		}
		
		if(isOnBar){
			if(abs(hsp) < 2){
				hsp = 2 * xdir;
			}else{
				if(xdir > 0){
					hsp = hsp * xdir;
				}else{
					hsp = hsp * -xdir;
				}
				
			}
		}
	
	}
	
	
}