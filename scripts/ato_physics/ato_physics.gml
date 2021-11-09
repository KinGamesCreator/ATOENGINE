// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function ato_physics(){
	physics = {
		h_f			: 0		,	//horizontal force
		v_f			: 0		,	//vertical force
		fric		: 1		,	//friction
		grav		: 1		,	//gravity
		activate	: true	,	//if is activated
	}
}

function ato_physics_execute(){
	
	if !variable_instance_exists(id,"physics") or !is_struct(physics) {
		ato_message("PHYSICS NOT DEFINED");
	}
	
	if (physics.activate) {
		physics.v_f += physics.grav * global.time_delta; //apply gravity
		
		#region collisions
		
		var pm = !place_free(x+physics.h_f * global.time_delta,y+physics.v_f * global.time_delta);
		if (pm) {
			
			//horizontal collision
			for (var i = 0; i < abs(physics.h_f * global.time_delta);i++) {
				if !place_free(x+sign(physics.h_f * global.time_delta),y) {
					physics.h_f = 0;
					break;
				}
				x+=sign(physics.h_f * global.time_delta);
			}
			
			//vertical collision
			for (var i = 0; i < abs(physics.v_f * global.time_delta);i++) {
				if !place_free(x,y+sign(physics.v_f * global.time_delta)){
					physics.v_f = 0;
					break;
				}
				y+=sign(physics.v_f * global.time_delta);
			}
			
		} else {
			x += physics.h_f * global.time_delta;
			y += physics.v_f * global.time_delta;
		}
		
		#endregion collisions
		
		var sign_initial = sign(physics.h_f);
		physics.h_f -= physics.fric * sign(physics.h_f) * global.time_delta;
		if (sign_initial != sign(physics.h_f)) {
			physics.h_f = 0;
		}
	}
}
