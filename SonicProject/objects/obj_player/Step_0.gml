p_physics();
p_move();

if collision_circle(x,y,16,obj_t_background,true,false){
	xlayer = 0;
}

if collision_circle(x,y,16,obj_t_foreground,true,false){
	xlayer = 1;
}

if collision_circle(x,y,16,obj_t_switch,true,false){
	if (hsp > 0 && ground){
		xlayer = 0;
	}
	if(hsp < 0 && ground){
		xlayer = 1;
	}
}

//collecting rings

with(obj_ring){
	if(collision_circle(x,y,6,obj_player,true,false)){
		if(getCooldown <= 0){
			obj_player.rings++;
			obj_player.boostLevel++;
			audio_play_sound(s_GetRing,1000,false);
			instance_destroy();
		}
	}
}

//taking damage

if(action != 1 && action != 2 && !isBoosting && !isStomping && action != -5 && !isTakingDamage && !isCooldown){
	with(obj_enGENERAL){
		if(collision_circle(x,y,10,obj_player,true,false)){
			if(!obj_player.isDead && obj_player.rings > 0){
				obj_player.vsp = obj_player.sjmp;
				obj_player.hsp += 2 * (-(obj_player.xdir));
				obj_player.isTakingDamage = true;
				obj_player.last_action = -5;
				obj_player.action = -5;
				obj_player.alarm[1] = 180;
			}
			
			
			if(obj_player.rings > 0){
				audio_play_sound(s_RingDrop,1000,false);
				for(i = 0; i < obj_player.rings; i++){
					var dropRing = instance_create_depth(random_range(obj_player.x - 64, obj_player.x + 64),random_range(obj_player.y - 48, obj_player.y),-1,obj_ring_drop);
				}
				obj_player.rings = 0;
			}else if(!obj_player.isDead && obj_player.rings <= 0){
				audio_play_sound(s_Dead,1000,false);
				obj_player.nLifes--;
				if(obj_player.last_action != -6){
					obj_player.image_i = 0;
				}
				obj_player.last_action = -6;
				obj_player.action = -6;
				obj_player.hsp = 0;
				obj_player.vsp = obj_player.jmp;
				obj_Camera.follow = noone;
				obj_player.isDead = true;
				obj_player.alarm[2] = 120;
			}
		}
	}
}

//giving damage

if(action = 1 || action = 2 || isBoosting){
	with(obj_enGENERAL){
		if(collision_circle(x,y,10,obj_player,true,false)){
			life--;
			if(obj_player.HomingAttackCount = obj_player.HomingAttackMaxCount){ //Starting homing attack delay
				obj_player.HomingAttackCount = 0;
			}
			if(obj_player.action = 1 && !obj_player.isHomingAttacking && !obj_player.isStomping){ //Small jump after attacking an enemy
				obj_player.vsp = obj_player.sjmp;
			}
			if(obj_player.isHomingAttacking){
				obj_player.isHomingAttacking = false;
				obj_player.targets[0] = noone;
				obj_player.hsp = 0;
				obj_player.vsp = obj_player.sjmp;
			}
			if(life <= 0){
				obj_player.boostLevel++;
				isDead = true;
				sprite_index = spr_enemyDestroy;
				alarm[0] = 20;
				alarm[1] = 10;
				alarm[2] = 5;
				//instance_destroy();
			}
		}
	}
}

//Boost

if(isBoosting){
	if(boostCount = 0){
		var BoostShockWave = instance_create_depth(x,y,-xdir,obj_boost_shockwave);
		boostLevel-=2;
		var BoostSoundBarrier = instance_create_depth(x,y,-xdir,obj_boost_soundbarrier);
		boostCount = 1;
	}
	if(ground){
		sparkFrame++;
		if(sparkFrame >= sparkFrameMax){
			var BoostSparks = instance_create_depth(x,y,-xdir,obj_boost_sparks);
			sparkFrame = 0;
		}
	}
	boostFrame++;
	if(boostFrame >= boostMaxFrame){
		boostFrame = 0;
		boostLevel--;
	}
	if(boostLevel <= 0){
		isBoosting = false;
	}
}else{
	boostCount = 0;
}

if(boostLevel >= boostMaxLevel * 2){
	boostLevel = boostMaxLevel * 2;
}


//Homing Attack

with(obj_enGENERAL){
	if(!obj_player.ground && collision_circle(x,y,100,obj_player,true,false) && !isDead){
		if((x < obj_player.x && obj_player.xdir = -1) || (x > obj_player.x && obj_player.xdir = 1)){
			selected = true;
			//add the enemy to the target list
			if(obj_player.targets[0] = noone){
				obj_player.targets[0] = self;
				audio_play_sound(s_LockOn,1000,false);
				break;
			}
			else if(self != obj_player.targets[0] && obj_player.targets[0] != noone && !isDead){
				zeroDistance = point_distance(obj_player.x,obj_player.y,obj_player.targets[0].x,obj_player.targets[0].y);
				curDistance = point_distance(obj_player.x,obj_player.y, x, y);
				if(curDistance < zeroDistance){
					obj_player.targets[0] = self;
					audio_play_sound(s_LockOn,1000,false);
				}else{
					selected = false;
				}
			}
		}
	}else{
		selected = false;
		if(self = obj_player.targets[0]){
			obj_player.targets[0] = noone;
		}
	}
}

//Homing Attack with springs

with(obj_spring){
	if(!obj_player.ground && collision_circle(x,y,100,obj_player,true,false)){
		if((x < obj_player.x && obj_player.xdir = -1) || (x > obj_player.x && obj_player.xdir = 1)){
			selected = true;
			//add the enemy to the target list
			if(obj_player.targets[0] = noone){
				obj_player.targets[0] = self;
				audio_play_sound(s_LockOn,1000,false);
				break;
			}
			else if(self != obj_player.targets[0] && obj_player.targets[0] != noone){
				zeroDistance = point_distance(obj_player.x,obj_player.y,obj_player.targets[0].x,obj_player.targets[0].y);
				curDistance = point_distance(obj_player.x,obj_player.y, x, y);
				if(curDistance < zeroDistance){
					obj_player.targets[0] = self;
					audio_play_sound(s_LockOn,1000,false);
				}else{
					selected = false;
				}
			}
		}
	}else{
		selected = false;
		if(self = obj_player.targets[0]){
			obj_player.targets[0] = noone;
		}
	}
}

