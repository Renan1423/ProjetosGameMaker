//Set up camera
cam = view_camera[0];
follow = obj_player;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;


xPlayerStart = obj_player.x;
yPlayerStart = obj_player.y;


frames = 0;
maxFrames = 30;

nLifesPlayer = obj_player.nLifes;