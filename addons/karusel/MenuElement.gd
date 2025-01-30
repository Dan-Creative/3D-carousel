extends Node2D

class_name KaruselElement

var id: int
var current_time: float
var target_time: float
var spd: float
var scaler: float
@onready var karusel: Karusel = $".."

func _ready() -> void:
	id = get_index()
	target_time = 360 * id
	spd = 57.296 * get_parent().get_child_count()
func _physics_process(delta: float) -> void:
	var timer: float
	timer = Time.get_ticks_msec()
	current_time = current_time + (target_time - current_time) * (karusel.spd * 0.01)
	scaler = max(min((global_position.y - get_parent().global_position.y) * 0.01, karusel.maxsize), karusel.minsize)
	position = Vector2(
		sin(current_time / spd) * karusel.amp,
		(cos(current_time / spd) * karusel.amp) * 0.5
	)
	scale = Vector2(scaler, scaler)
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		target_time += 360
	elif event.is_action_pressed("ui_right"):
		target_time -= 360
	if event.is_action_pressed("ui_accept"):
		print(scaler)
		current_time = 0
