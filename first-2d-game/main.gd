extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.hit.connect(game_over)
	$StartTimer.timeout.connect(_on_start_timer_timeout)
	$ScoreTimer.timeout.connect(_on_score_timer_timeout)
	$MobTimer.timeout.connect(_on_mob_timer_timeout)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_mob_timer_timeout():
	pass
