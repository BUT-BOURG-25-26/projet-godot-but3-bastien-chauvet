extends CanvasLayer



func _on_play_pressed() -> void:
	GameManager.launch()


func _on_quit_pressed() -> void:
	get_tree().quit()
