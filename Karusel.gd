extends Marker2D

class_name Karusel

@export var current_time: float
@export var amp: float = 200
@export_range(0, 100) var spd: float = 10
@export var maxsize: float = 1
@export var minsize: float = 0.2
var timer: float

func _physics_process(delta: float) -> void:
	timer = Time.get_ticks_msec()
