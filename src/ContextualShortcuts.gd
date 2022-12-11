extends Node

class_name Keyset

func get_shortcuts():
	var parser = XMLParser.new()
	var error = parser.open("example_keyset.xml")
	var shortcuts = []
	var i = 0
	if error != OK:
		print("Error opening XML file ", error)
		return
		
	while parser.read() == OK:
		if parser.get_node_type() == parser.NODE_ELEMENT and parser.get_node_type() != parser.NODE_COMMENT and parser.get_node_name() == "Shortcut":
			var context = parser.get_named_attribute_value_safe("context")
			var shortcut = parser.get_named_attribute_value_safe("shortcut")
			var keybind = parser.get_named_attribute_value_safe("keybind")
			if !context.empty() and !keybind.empty():
				var sc: Shortcut = Shortcut.new()
				sc.name = "shortcut" + str(i)
				sc.shortcutContext = context
				sc.shortcutName = shortcut
				sc.shortcutKeybind = keybind
				shortcuts.append(sc)
				i = i+1
	return shortcuts
	
func parse_keybind(keybind: String):
	var key_count: int = keybind.countn(" ") + 1
	return keybind.rsplit(" ", false, key_count)

func get_keyset():
	var shortcuts = get_shortcuts()
	parse_keybind(shortcuts[0].shortcutKeybind)
	return shortcuts
