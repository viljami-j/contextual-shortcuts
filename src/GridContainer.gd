extends GridContainer


# TODO:
# Create parser from UE shortcuts -> something this program can consume
# TODO:
# ^^^^^ If above is completed - contextual rebinding of shortcuts is possible to implement

# Lock to context / Pin Context ominaisuus? Estää kontekstia vaihtumasta

# Configuration
var keys_path = "res://US_ComputerKeys/"


# Where to look for hook_target?
const hook_dir: String = "res://hook/" 
const hook_target: String = "cs.txt"
const hook_dir_scan_delay: float = 0.1 # seconds

# Utility
var ks = Keyset.new()
var shortcuts = [] #= ks.get_shortcuts(ks)
var collected_sc_refs = [] # Flush to empty GUI elements

var key_textures_dict = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	setupWatcher()
	self.add_constant_override("vseparation", 40)
	self.add_constant_override("hseparation", 40)
	reload_computer_key_textures()
	
func setupWatcher():
	var watcher = DirectoryWatcher.new()
	watcher.scan_delay = hook_dir_scan_delay #seconds
	add_child(watcher)
	watcher.add_scan_directory(hook_dir)
	watcher.connect("files_created", self, "on_files_created_modified")
	watcher.connect("files_modified", self, "on_files_created_modified")

func on_files_created_modified(e):
	if hook_target in e[0]:
		var file = File.new()
		file.open(hook_dir + hook_target, File.READ)
		var cs_content = file.get_as_text()
		var xml = cs_content.rsplit(" ", false, 1)[0]
		var context = cs_content.rsplit(" ", false, 1)[1]
		$"../../CurrentContext".text = context
		# Parse from XML into 'Shortcut' structs, that contain:
		# shortcutContext: String
		# shortcutName: String
		# shortcutKeybind: String
		shortcuts = ks.get_shortcuts(xml)
		
		# Flush prev. instantiated shortcuts
		for ref in collected_sc_refs:
			ref.hide()
			ref.queue_free()
		
		# Populate arr of shortcuts that will be loaded upon hook_target modifications
		collected_sc_refs.clear()
		for shortcut in shortcuts:
			if shortcut.shortcutContext == context:
				collected_sc_refs.append(create_gui_shortcut(shortcut))
		shortcuts.clear()
		file.close()
		

func create_gui_shortcut(shortcut: Shortcut):
	var keys = ks.parse_keybind(shortcut.shortcutKeybind)
	var vbc: VBoxContainer = VBoxContainer.new()
	var lbl = Label.new()
	var hbc = HBoxContainer.new()
	
	lbl.text = shortcut.shortcutName
	
	# Init VBC # TODO: Init with preview settings rather than hardcoded, WHY?: Allows editing sizes from GUI editor view
	vbc.add_child(lbl)
	vbc.add_constant_override("separation", 10)
	vbc.add_child(hbc)
	
	for key in keys:
		var txr = TextureRect.new()
		txr.expand = true
		txr.rect_min_size = Vector2(50,50)
		# TODO: Add rest of the keys
		if key_textures_dict.has(key):
			txr.texture = key_textures_dict[key]
		hbc.add_child(txr)
	
	add_child(vbc, true)
	return vbc

func reload_computer_key_textures():
	# TODO: Add a path check that outputs a nice clear print of whats wrong
	var path = keys_path
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		elif !file_name.begins_with(".") and file_name.ends_with(".png"):
			#get_next() returns a string so this can be used to load the images into an array.
			key_textures_dict[file_name.replace(".png", "")] = load((path + file_name))
	dir.list_dir_end()
