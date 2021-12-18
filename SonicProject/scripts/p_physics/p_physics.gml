function p_physics(){
	
	
	//limits
	if(hsp > hspl){
		hsp = hspl;
	}
	if(hsp < -hspl){
		hsp = -hspl;
	}
	
	if(vsp > vspl){
		vsp = vspl;
	}
	if(vsp < -vspl){
		vsp = vspl;
	}
	
	//h movement
	
	if(hsp > 0){
		/*for(i = 0; i < hsp && !collision_circle(x+16,y,3,obj_walls,true,true); i++){
			x++;
		}*/
		for(i = 0; i < hsp && !collision_script_right(16); i++){
			x+=acos;
			y-=asin;
		}
		
	}
	
	if(hsp < 0){
		
		/*for(i = 0; i > hsp && !collision_circle(x-16,y,3,obj_walls,true,true); i--){
			x--;
		}*/
		for(i = 0; i > hsp && !collision_script_left(16); i--){
			x-=acos;
			y+=asin;
		}
		
	}
	
	//v movement
	
	if(vsp > 0){
		/*for(i = 0; i < vsp && !collision_circle(x,y+16,3,obj_walls,true,true); i++){
			y++;
		}*/
		for(i = 0; i < vsp && !collision_script_bottom(16); i++){
			y++;
		}
	}
	
	if(vsp < 0){
		/*for(i = 0; i > vsp && !collision_circle(x,y-16,3,obj_walls,true,true); i--){
			y--;
		}*/
		for(i = 0; i > vsp && !collision_script_top(10); i--){
			y--;
		}
	}
	
	//landing
	
	//if(vsp >= 0 && !ground && collision_circle(x,y+16,4,obj_walls,true,true)){
	if(vsp >= 0 && !ground && collision_script_bottom(16) && (collision_script_left_line(16) || collision_script_right_line(16))){
		angle = find_angle(angle,10,16); //16,16
		acos = cos(degtorad(angle));
		asin = sin(degtorad(angle));
		if(!isDead){
			vsp = 0;
			ground = true;
		}
	}
	
	//lock to ground
	
	if(ground && !isDead){
		while (collision_script_main(16)){
			x-=asin;
			y-=acos;
		}
		while (collision_script_ground(16) && !collision_script_main){
			x+=asin;
			y+=acos;
		}
	}
	
	//wall collision
	
	//while(collision_circle(x+16,y,3,obj_walls,true,true)){
	while(collision_script_right(16)){
		x-=acos;
		y+=asin;
	}
	while(collision_script_left(16)){
		x+=acos;
		y-=asin;
	}
	
	//leave ground
	
	//if(!collision_circle(x,y+16,4,obj_walls,true,true) && ground){
	if((!collision_script_left_line(16) || !collision_script_right_line(16)) && ground){
		ground = false;
	}
	
	//gravity
	
	if(!ground){
		vsp += grv;
	}
	
	//angle speed
	
	if(angle > 70 && angle < 290 && abs(hsp) < 2.5){
		angle = 0;
		vsp = -(asin*hsp);
		hsp = (acos*hsp);
		ground = 0;
	}
	
	//slope factor
	
	if(action = 0){
		slp = 0.125;
	}
	if(action = 2){
		if(sign(hsp) = sign(asin)){
			slp = 0.078125;
		}
		if(sign(hsp) != sign(asin)){
			slp = 0.3125;
		}
	}
	if(action >= 0){
		hsp -= slp*asin;
	}
	
	if(ground && collision_script_left_line(16) && collision_script_right_line(16)){
		angle = find_angle(angle,16,24);
	}else{
		angle = 0;
	}
	
	acos = cos(degtorad(angle));
	asin = sin(degtorad(angle));
	
}