/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (instance_number(obj_ato_essentials) > 1) {
	ato_message("essentials duplicated");
	instance_destroy();
} else {
	global.time_delta = 1;
}