/// @description Insert description here
// You can write your code in this editor
layer_set_visible("Isometric_map",false);



global.mapaFinal = ds_grid_create(WIDTH_MAP,HEIGHT_MAP);

var infoMap = layer_tilemap_get_id("Isometric_map");

for(var xx = 0; xx < WIDTH_MAP; xx++){
for(var yy = 0; yy < HEIGHT_MAP; yy++){
	var tileMapData = tilemap_get(infoMap,xx,yy);
	var tileAtual = [-1,0];
	tileAtual[TILE.SPRITE] = tileMapData;
	tileAtual[TILE.Z] = 0;
	global.mapaFinal[# xx,yy] = tileAtual;
}	
}