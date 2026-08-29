extends Control

var question_list =[
	["What kind of bear is best?\nA: Black     B: Brown", "A"],
	["Q2", "B"],
	["Q3", "C"],
	["Q4", "D"],
	["Q5", "E"]
]

var curr_index = -1
var cam

@export var slowed_time : float = 0.25

func _ready() -> void:
	cam = get_parent().get_parent()

func on_text_entered() -> void:
	var text : String = $TextInput.get_line(0)
	text = text.strip_edges()
	
	if text.nocasecmp_to("Attack()") == 0:
		curr_index = 0
		prompt_question()
	elif text.nocasecmp_to("Crouch()") == 0:
		print("Crouch")
	elif text.nocasecmp_to("Block()") == 0:
		print("Block")
	
	$TextInput.text = ""

func prompt_question():
	$QuestionLabel.text = question_list[curr_index][0]
	$QuestionLabel.visible = true

func answer_question():
	var text : String = $TextInput.get_line(0)
	text = text.strip_edges()
	
	if text.nocasecmp_to(question_list[curr_index][1]) == 0:
		print("Success")
		$TextInput.visible = false
	else:
		print("Fail")
	
	$TextInput.text = ""
	$QuestionLabel.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Enter"):
		if $QuestionLabel.visible:
			answer_question()
		else:
			on_text_entered()
	elif(Input.is_action_just_pressed("InputBar")):
		if $TextInput.visible:
			$TextInput.visible = false
			cam.target.is_player_active = true
			Engine.time_scale = 1.0
		else:
			$TextInput.visible = true
			cam.target.is_player_active = false
			Engine.time_scale = slowed_time
