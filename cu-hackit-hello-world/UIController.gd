extends Control

@export var question_list : Array[Array]


func on_text_entered() -> void:
	var text : String = $TextInput.get_line(0)
	text = text.strip_edges()
	
	if text.nocasecmp_to("Attack()") == 0:
		prompt_question(0)
	elif text.nocasecmp_to("Crouch()") == 0:
		print("Crouch")
	elif text.nocasecmp_to("Block()") == 0:
		print("Block")
	
	$TextInput.text = ""

func prompt_question(index : int):
	$QuestionLabel.text = question_list[index][0]
	$QuestionLabel.visible = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Enter"):
		on_text_entered()
	elif(Input.is_action_just_pressed("InputBar")):
		if $TextInput.visible:
			$TextInput.visible = false
		else:
			$TextInput.visible = true
