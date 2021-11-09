/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#region states

switch(state) {
	case "idle":
	if (sprite_index != sprites.SP_idle) {
		sprite_index = sprites.SP_idle;
	}
	break;
	
	case "died":
	if (sprite_index != sprites.SP_die) {
		sprite_index = sprites.SP_die;
		movement = false;
	} else {
		if (floor(image_index) = (image_number - 1)) {
			image_speed = 0;
		}
	}
	break;
	
	case "walking":
	if (sprite_index != sprites.SP_walk) {
		sprite_index = sprites.SP_walk;
		movement = true;
	}
	
	break;
	
	case "running":
	sprite_index = sprites.SP_run;
	break;
	
	case "jumping":
	sprite_index = sprites.SP_jump;
	break;
	
	case "falling":
	sprite_index = sprites.SP_fall;
	break;
	
	case "shoot":
	sprite_index = sprites.SP_shoot;
	break;
}

#endregion

if (movement) {
	
	#region animations
	
	if place_free(x,y+sign(physics.grav)) and (sign(physics.v_f) == sign(physics.grav)) {
		state = "falling";
	} else if (physics.v_f != 0) and  (sign(physics.v_f) != sign(physics.grav)) {
		state = "jumping";
	} else if (physics.h_f != 0) {
		if keyboard_check(input.run) {
			state = "running";
		} else {
			state = "walking";
		}
	} else {
		state = "idle";
	}
	
	if keyboard_check(input.shoot) {
		state = "shoot";
	}
	
	#endregion
	
	//Walk and run
	var force_move = keyboard_check(input.right) - keyboard_check(input.left);
	if keyboard_check(input.run) {
		physics.h_f += force_move * data.r_speed;
		if abs(physics.h_f) > data.r_speed {
			physics.h_f = data.r_speed * sign(physics.h_f);
		}
	} else {
		physics.h_f += force_move * data.w_speed;
		if abs(physics.h_f) > data.w_speed {
			physics.h_f = data.w_speed * sign(physics.h_f);
		}
	}
	
	//Jump
	if keyboard_check_pressed(input.jump) and !place_free(x,y+sign(physics.grav)) {
		physics.v_f = -sign(physics.grav) * data.jump_force;
	}
	
	//Guns
	if array_length(data.unlocked_guns) > 0 {
		//change
		var change = keyboard_check_pressed(input.post) - keyboard_check_pressed(input.prev);
		gun += change;
	}
	
	
}

ato_physics_execute();
