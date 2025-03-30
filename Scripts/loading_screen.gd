extends Control
@export var loading_bar : ProgressBar
@export var percentage_number : Label

var scene_path : String
var progress : Array

var update : float = 0.0

func _ready():
	scene_path = Loader.scene_path
	ResourceLoader.load_threaded_request(scene_path,"",true)


func _process(delta):
	ResourceLoader.load_threaded_get_status(scene_path, progress)
	
	if progress[0] > update:
		update = progress[0]
	
	loading_bar.value = update
	percentage_number.text = str(int(update*100.0)) + "%"
	
	if loading_bar.value >= 1.0:
		get_tree().change_scene_to_packed(
			ResourceLoader.load_threaded_get(scene_path)
		)
