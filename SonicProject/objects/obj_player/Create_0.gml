hsp = 0; //horizontal speed
vsp = 0; //vertical speed

hspl = 16; //horizontal speed limit
hspm = 10; //soft speed cap
vspl = 16; //vertical speed limit

isBoosting = false;
boostCount = 0;
splBoost = 20; //boost speed
sparkFrame = 0; //boost sparks
sparkFrameMax = 8;
boostLevel = 0;
boostMaxLevel = 16;
boostFrame = 0;
boostMaxFrame = 10;

jmp = -5.5; // normal jump
sjmp = -3; // smaller jump

isStomping = false; // stomp
spStomp = 11; //stomp speed

acc = 0.046875; //acceleration
dcc = 0.5; //desaceleration

adrag = 0.96875;
bfr = 0.023475; // ball friction
bdcc = 0.1484375; // ball desaceleration
sp = 0; //spin power
spot = 0;
isCharging = false; //check if the player is charging the spin dash

xdir = 1;
xlayer = 0;

frc = 0.046875; // friction

grv = 0.21875; //gravity
startgrv = grv; //initial gravity

ground = false; // check if the character is on the ground or not

action = 0; //sonic states

acos=1; //angle cosine
asin=0; //angle sine

angle = 0;

//Homing Attack

targets[0] = noone;
strikeXspeed = 8;
strikeYspeed = 8;
isHomingAttacking = false;
HomingAttackCooldown = false;

HomingAttackMaxCount = 20;
HomingAttackCount = HomingAttackMaxCount;



//Spring

isSpringing = false;

//Bar

isOnBar = false;

//Life

rings = 0; //number of rings
nLifes = 2; //number of lifes

isTakingDamage = false;

isCooldown = false;
cooldownCount = 0;
cooldownMaxCount = 15;
cooldownTransparent = 0;

isDead = false;

//sprites

image_index = 0;
sprite_index = 0;
image_speed = 0;

sprp = spr_sonic_idle;
frame = 0;
image_i = 0;
last_action = 0;

obj_Camera.follow = obj_player;
