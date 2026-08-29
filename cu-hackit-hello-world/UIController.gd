extends Control

var question_list =[
	["Print Hello world using C?", "printf(\"Hello world\");"],
	["Given variable numCars = 9 How to do make the statement output 9", "printf(\"%d\",numCars);"],
	["Type the actual output of each statement. Assume userAge is 32. printf(\"You are %d years.\", userAge);", "You are 32 years."],
	["Fix the syntax errors. Assume variable numDogs has been declared. printf(\"%d\", numDogs).", "printf(\"%d\",numDogs);"],
	["Type Hello World In the same line of code but on differnt lines", "printf(\"Hello \nWorld\");"]
]

var curr_index = -1
var curr_action = "N/A"
var player

@export var slowed_time : float = 0.25

func _ready() -> void:
	player = get_parent().get_parent().target

func on_text_entered() -> void:
	var text : String = $TextInput.get_line(0)
	text = text.strip_edges()
	
	if text.nocasecmp_to("Attack()") == 0:
		curr_index = randi_range(0, question_list.size())
		curr_action = "attack"
		prompt_question()
	elif text.nocasecmp_to("Crouch()") == 0:
		curr_index = randi_range(0, question_list.size())
		curr_action = "crouch"
		prompt_question()
	elif text.nocasecmp_to("Block()") == 0:
		curr_index = randi_range(0, question_list.size())
		curr_action = "block"
		prompt_question()
	
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
		
		if curr_action == "attack":
			attack()
		elif curr_action == "block":
			block()
	else:
		print("Fail")
	
	$TextInput.text = ""
	$QuestionLabel.visible = false

func attack():
	player.attack()

func block():
	player.block()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Enter"):
		if $QuestionLabel.visible:
			answer_question()
		else:
			on_text_entered()
	elif(Input.is_action_just_pressed("InputBar")):
		if $TextInput.visible:
			$TextInput.visible = false
			player.is_player_active = true
			Engine.time_scale = 1.0
		else:
			$TextInput.visible = true
			player.is_player_active = false
			Engine.time_scale = slowed_time
