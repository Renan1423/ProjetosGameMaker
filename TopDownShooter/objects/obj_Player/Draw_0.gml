//draw_self();

draw_sprite_ext(sprite_index,0,x,y,1,1,point_direction(x,y,mouse_x,mouse_y),c_white,1);

var CurrentLife = floor((life/100) * 3);

for(var i = 0; i < CurrentLife; i++){
	draw_sprite(spr_Heart,0,20 + (i * 48) + (i * 10), 20);
}