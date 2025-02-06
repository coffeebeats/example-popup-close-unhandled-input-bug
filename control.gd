extends Control


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action("ui_cancel"):
		return

	prints(event)
