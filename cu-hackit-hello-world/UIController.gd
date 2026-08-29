extends Control




func on_text_entered() -> void:
	var text : String = $TextEdit.get_line(0)
	text = text.strip_edges()
	
	if text.nocasecmp_to("Attack()") == 0:
		print("Attack")
	elif text.nocasecmp_to("Crouch()") == 0:
		print("Crouch")
	elif text.nocasecmp_to("Block()") == 0:
		print("Block")
	
	$TextEdit.text = ""


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Enter"):
		on_text_entered()
	elif(Input.is_action_just_pressed("InputBar")):
		if $TextEdit.visible:
			$TextEdit.visible = false
		else:
			$TextEdit.visible = true
