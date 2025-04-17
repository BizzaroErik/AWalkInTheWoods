class_name Followable
extends Area2D

signal followable_activated

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#print("follow signal sent from cat")
		followable_activated.emit()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		pass
		#print("someone entered this body")
	
