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
func _process(_delta):
	pass
 
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	
	
func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	
	$Player.start($StartPosition.position)
	$StartTimer.start()
	get_tree().call_group("mobs", "queue_free")

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)
	
func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene
	var mob = mob_scene.instantiate()
	
	# Escolhe localização aleatória do Path2D
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	# Direciona mob perpendicularmente à direção do caminho
	var direction = mob_spawn_location.rotation + PI/2
	
	# Define posição do mob como a localização aleatória previamente escolhida
	mob.position = mob_spawn_location.position
	
	# Adiciona mais aleatoriedade à direção
	direction += randf_range(-PI/4,PI/4)

	# Escolhe velocidade do Mob
	var velocity = Vector2(randf_range(150.0,250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# Spawna o mob adicionando ele à cena principal
	add_child(mob)
	
	
