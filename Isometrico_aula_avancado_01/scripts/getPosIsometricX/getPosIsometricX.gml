function getPosIsometricX(argument0, argument1) {
	var tx = argument0;
	var ty = argument1;

	return ((tx - ty) * (TILE_WIDTH * 0.5)) + (SCREEN_W * 0.5);


}
