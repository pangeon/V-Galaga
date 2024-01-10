extends Node

func save_file(content: String, path: String) -> void:
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)
	file.close()

func load_file_content_as_array(path: String, separator: String) -> PackedStringArray:
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().split(separator, true)
	file.close()
	
	return content

func to_int(str_arr: PackedStringArray) -> PackedInt32Array:
	var int_arr: PackedInt32Array = []
	for i in range(0, str_arr.size()):
		int_arr.append(int(str_arr[i].substr(3)))
	
	return int_arr
	
	
