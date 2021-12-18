
//Player type
draw_sprite_ext(spr_player_type,image_i,40,20,4,4,0,c_white,1);

//Life

draw_set_font(SonicAdvanceFontSmaller);

draw_set_color(c_black);
draw_text_ext(1251,21,"x",20,200);
draw_text_ext(1311,21,string(nLifes),20,200);

draw_set_color(c_white);
draw_text_ext(1246,17,"x",20,200);
draw_text_ext(1306,17,string(nLifes),20,200);

draw_sprite_ext(spr_lifeUI,image_i,1140,22,5,5,0,c_white,1);

//Player's rings

draw_set_font(SonicAdvanceFont);
draw_set_color(c_black);
if(rings < 10){
	draw_text_ext(174,21,"00" + string(rings),0,100);
}else if(rings >= 10 && rings < 100){
	draw_text_ext(174,21,"0" + string(rings),0,100);
}else{
	draw_text_ext(174,21,"" + string(rings),0,100);
}

draw_set_color(c_white);
if(rings < 10){
	draw_text_ext(170,17,"00" + string(rings),10,100);
}else if(rings >= 10 && rings < 100){
	draw_text_ext(170,17,"0" + string(rings),10,100);
}else{
	draw_text_ext(170,17,"" + string(rings),10,100);
}

//Player's boost gauge

draw_sprite_ext(spr_BoostGauge,image_i,960,630,1.5,1.5,0,c_white,1);
for(i = 0; i < boostMaxLevel; i++){
	draw_sprite_ext(spr_Cell,image_i,1010 + (5 * 3.3 * i),698,3.3,3.3,0,c_white,1);
}
for(i = 0; i < boostLevel; i++){
	if(i < boostMaxLevel){
		draw_sprite_ext(spr_FilledCell,image_i,1010 + (5 * 3.3 * i),698,3.3,3.3,0,c_white,1);
	}else{
		draw_sprite_ext(spr_DoubleFilledCell,image_i,1010 + (5 * 3.3 * (i - boostMaxLevel)),698,3.3,3.3,0,c_white,1);
	}
}
