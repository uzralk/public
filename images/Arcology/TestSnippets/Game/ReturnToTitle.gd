extends Control


func _on_Button_pressed():
	get_tree().change_scene('res://title_screen/TitleScreen.tscn')


func _on_Button2_pressed():
	get_tree().change_scene('res://title_screen/SceneSpeak.tscn')
