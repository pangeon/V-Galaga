extends Node

func _ready():
	var list_arr: PackedStringArray = load_file_content_as_array("res://high_score.dat", "\n")
	list_arr[3] = "4. 7000"
	var str_lines: String = "\n".join(list_arr)
	
	print(list_arr)
	print(str_lines)


func save_file(content: String, path: String) -> void:
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)
	file.close()

func load_file_content_as_array(path: String, separator: String) -> PackedStringArray:
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().split(separator, true)
	file.close()
	
	return content

func cast_score_to_int(str_arr: PackedStringArray):
	var int_arr: PackedInt32Array = []
	for i in range(0, str_arr.size()):
		int_arr.append(int(str_arr[i].substr(3)))
	
	return int_arr
	
	
