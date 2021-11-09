// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function ato_message(_message = "invalid message"){
	show_debug_message("!ATO ENGINE: " + _message + "\nObject:" + object_get_name(id) + "\nRoom: " + room_get_name(room));
}