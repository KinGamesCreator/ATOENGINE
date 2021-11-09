/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

mask_index = sprite_index;

ato_physics();

input = { //player input
	//action
	shoot    : vk_space	 ,
	prev	 : ord("Q")	 ,
	post 	 : ord("E")	 ,
	
	aim_up   : ord("W")	 ,
	aim_down : ord("S")	 ,
	aim_left : ord("A")	 ,
	aim_right: ord("D")	 ,
	
	//movement
	run      : vk_shift  ,
	right    : vk_right  ,
	left     : vk_left   ,
	down     : vk_down   ,
	jump     : vk_up
}

data = {
	mask : spr_skull_mask,
	mask_crouch : spr_skull_mask_crouch,
	jump_force	: 20 , //jump force
	w_speed		: 10 , //walk speed
	r_speed		: 15 , //run speed
	unlocked_guns	: [0], //unlocked guns
}

sprites = {
	SP_idle	: spr_skull_idle,
	SP_walk	: spr_player,
	SP_run	: spr_player,
	SP_shoot: spr_player,
	SP_die	: spr_skull_death,
	SP_jump	: spr_skull_jump,
	SP_fall	: spr_player,
	SP_crouch : spr_skull_crouch
}

//variables
state = "idle"; //idle walking running jumping falling died shoot
gun = -1;		//gun selected
movement = true;//movement functions activated or desactivated
