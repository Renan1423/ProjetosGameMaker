var life = obj_Player.life;
var maxLife = obj_Player.maxLife;

var xx = 20;
var yy = 20;
var yy3 = 19;
var xx3 = 19;
var ww = xx + ((life/maxLife) * 200);
var ww2 = 120 + 100;
var ww3 = 122 + 100;
var hh = 60;
var hh3 = 62;

draw_set_color(make_color_rgb(255,255,255));
draw_rectangle(xx3,yy3,ww3,hh3,0);

draw_set_color(make_color_rgb(0,0,0));
draw_rectangle(xx,yy,ww2,hh,0);

draw_set_color(make_color_rgb(0,255,0));
draw_rectangle(xx,yy,ww,hh,0);

draw_set_color(make_color_rgb(255,255,255));

draw_set_font(fnt_Ui);
draw_text(50,30,"Vida: " + string(life));