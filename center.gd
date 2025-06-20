@tool
extends Node3D

@export var yaw: float = -90.0
@export var pitch: float = 0.0
@export var roll: float = 0.0

@export var front: Vector3 = Vector3.ZERO
@export var up: Vector3 = Vector3.ZERO
@export var right: Vector3 = Vector3.ZERO

@export var world_up: Vector3 = Vector3.UP

func _init() -> void:
	pass

func _process(delta: float) -> void:
	var quat_rotation = Quaternion.IDENTITY
	quat_rotation *= Quaternion(Vector3.UP, deg_to_rad(yaw))
	quat_rotation *= Quaternion(Vector3.RIGHT, deg_to_rad(pitch))
	quat_rotation *= Quaternion(Vector3.FORWARD, deg_to_rad(roll))
	
	var basis = Basis(quat_rotation)
	
	front = -basis.z.normalized()
	right = basis.x.normalized()
	up = basis.y.normalized()
	
	DebugDraw3D.draw_arrow(
		position, 
		position + front, 
		Color(1.0, 0.0, 0.0),
		0.001
	)
	
	DebugDraw3D.draw_text(position + (front * 1.2), "front")
	
	DebugDraw3D.draw_arrow(
		position, 
		position + right,
		Color(0.0, 1.0, 0.0),
		0.001
	)
	
	DebugDraw3D.draw_text(position + (right * 1.2), "right")
	
	DebugDraw3D.draw_arrow(
		position, 
		position + up,
		Color(0.0, 0.0, 1.0),
		0.001
	)
	
	DebugDraw3D.draw_text(position + (up * 1.2), "up")
