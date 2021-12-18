draw_self();

//Choosing the sprite
if(place_meeting(x + sprite_width,y,obj_bar) && !place_meeting(x - sprite_width,y,obj_bar)){ //Bar on the right!
	draw_sprite_ext(spr_barLeft,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);
}
else if(!place_meeting(x + sprite_width,y,obj_bar) && place_meeting(x - sprite_width,y,obj_bar)){ //Bar on the left!
	draw_sprite_ext(spr_barRight,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);
}
else if(place_meeting(x + sprite_width,y,obj_bar) && place_meeting(x - sprite_width,y,obj_bar)){ //Bar on both sides!
	draw_sprite_ext(spr_bar,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);
}

//Choosing the angle

/*
if(!place_meeting(x + sprite_width,y + sprite_height,obj_bar) && !place_meeting(x - sprite_width,y - sprite_height,obj_bar)){ //Bar on both sides!
	image_angle = 0;
}
else if((place_meeting(x + sprite_width,y + sprite_height,obj_bar) || place_meeting(x - sprite_width,y - sprite_height,obj_bar)) && (!place_meeting(x - sprite_width,y + sprite_height,obj_bar) || !place_meeting(x + sprite_width,y - sprite_height,obj_bar))){ //Bar on the right!
	image_angle = 45;
}
else if((!place_meeting(x + sprite_width,y + sprite_height,obj_bar) || !place_meeting(x - sprite_width,y - sprite_height,obj_bar)) && (place_meeting(x - sprite_width,y + sprite_height,obj_bar) || place_meeting(x + sprite_width,y - sprite_height,obj_bar))){ //Bar on the left!
	image_angle = -45;
}*/

/*
if(!collision_circle(x + sprite_width,y + sprite_height,16,obj_bar,true,false) && !collision_circle(x - sprite_width,y - sprite_height,16,obj_bar,true,false)){ //Bar on both sides!
	draw_sprite_ext(spr_barLeft,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
}
else if((collision_circle(x + sprite_width,y + sprite_height,16,obj_bar,true,false) || collision_circle(x - sprite_width,y - sprite_height,16,obj_bar,true,false)) && (!collision_circle(x - sprite_width,y + sprite_height,16,obj_bar,true,false) || !collision_circle(x + sprite_width,y - sprite_height,16,obj_bar,true,false))){ //Bar on the right!
	draw_sprite_ext(spr_barRight,image_index,x,y,image_xscale,image_yscale,45,c_white,1);
}
else if((!collision_circle(x + sprite_width,y + sprite_height,16,obj_bar,true,false) || !collision_circle(x - sprite_width,y - sprite_height,16,obj_bar,true,false)) && (collision_circle(x - sprite_width,y + sprite_height,16,obj_bar,true,false) || collision_circle(x + sprite_width,y - sprite_height,16,obj_bar,true,false))){ //Bar on the left!
	draw_sprite_ext(spr_bar,image_index,x,y,image_xscale,image_yscale,-45,c_white,1);
}*/


//draw_sprite_ext(spr_barLeft,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);