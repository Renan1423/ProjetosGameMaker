//Update camera


//Update destination

if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

//Update object position

//x += (xTo - x) / 25;
//y += (yTo - y) / 25;
x += (xTo - x);
y += (yTo - y) / 10;

//Camera Clamp

x = clamp(x,view_w_half,room_width - view_w_half);
y = clamp(y,view_h_half,room_height - view_h_half);

//Update camera view

camera_set_view_pos(cam,x - view_w_half,y - view_h_half);


//bottom background

if(layer_exists("BackgroundBottomLayer"))
{
	layer_x("BackgroundBottomLayer",x);	
	layer_y("BackgroundBottomLayer",y - view_h_half);
}

//instantiate player

if(!instance_exists(obj_player)){
	
	frames++;
	
	if(frames >= maxFrames && nLifesPlayer > 0){
		frames = 0;
		var Player = instance_create_depth(xPlayerStart,yPlayerStart,-1,obj_player);
		follow = Player;
		nLifesPlayer--;
		Player.nLifes = nLifesPlayer;
	}
}