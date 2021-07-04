-- local variables for API functions. any changes to the line below will be lost on re-generation
local bit_bor, client_find_signature, client_set_event_callback, client_visible, entity_get_local_player, entity_get_origin, entity_get_prop, entity_is_alive, entity_set_prop, globals_curtime, globals_frametime, globals_tickinterval, math_max, math_min, renderer_load_rgba, renderer_measure_text, renderer_text, renderer_texture, renderer_world_to_screen, table_sort, ui_get, ui_new_checkbox, ui_new_color_picker, ui_new_hotkey, ui_new_slider, ui_set_callback, ui_set_visible, vtable_bind, pairs, unpack = bit.bor, client.find_signature, client.set_event_callback, client.visible, entity.get_local_player, entity.get_origin, entity.get_prop, entity.is_alive, entity.set_prop, globals.curtime, globals.frametime, globals.tickinterval, math.max, math.min, renderer.load_rgba, renderer.measure_text, renderer.text, renderer.texture, renderer.world_to_screen, table.sort, ui.get, ui.new_checkbox, ui.new_color_picker, ui.new_hotkey, ui.new_slider, ui.set_callback, ui.set_visible, vtable_bind, pairs, unpack
local icon = '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x07\xFF\xFF\xFF\x57\xFF\xFF\xFF\xB1\xFF\xFF\xFF\xD6\xFF\xFF\xFF\xEE\xFF\xFF\xFF\xF4\xFF\xFF\xFF\xD3\xFF\xFF\xFF\xAE\xFF\xFF\xFF\x61\xFF\xFF\xFF\x0E\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x05\xFF\xFF\xFF\x86\xFF\xFF\xFF\xEF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF1\xFF\xFF\xFF\xEB\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF6\xFF\xFF\xFF\x85\xFF\xFF\xFF\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x22\xFF\xFF\xFF\xCA\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF2\xFF\xFF\xFF\xA0\xFF\xFF\xFF\x43\xFF\xFF\xFF\x0A\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x0D\xFF\xFF\xFF\x47\xFF\xFF\xFF\xC3\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xD5\xFF\xFF\xFF\x28\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x2B\xFF\xFF\xFF\xF0\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xBA\xFF\xFF\xFF\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x12\xFF\xFF\xFF\x25\xFF\xFF\xFF\x01\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x44\xFF\xFF\xFF\xC4\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xE7\xFF\xFF\xFF\x28\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x0C\xFF\xFF\xFF\xD8\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x88\xFF\xFF\xFF\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xD0\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF0\xFF\xFF\xFF\xBC\xFF\xFF\xFF\x44\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xAB\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xE4\xFF\xFF\xFF\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x7C\xFF\xFF\xFF\xE2\xFF\xFF\xFF\x32\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xA6\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xAE\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x57\xFF\xFF\xFF\xB9\xFF\xFF\xFF\xEC\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x99\xFF\xFF\xFF\x0D\xFF\xFF\xFF\x0C\xFF\xFF\xFF\xD4\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x9B\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x32\xFF\xFF\xFF\xE2\xFF\xFF\xFF\x7C\xFF\xFF\xFF\x68\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xEE\xFF\xFF\xFF\x24\x00\x00\x00\x00\xFF\xFF\xFF\x24\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xE1\xFF\xFF\xFF\x0F\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x48\xFF\xFF\xFF\xE4\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xAF\x00\x00\x00\x00\xFF\xFF\xFF\x25\xFF\xFF\xFF\xF0\xFF\xFF\xFF\xFE\xFF\xFF\xFF\x2E\x00\x00\x00\x00\xFF\xFF\xFF\x24\xFF\xFF\xFF\xEE\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x68\x00\x00\x00\x00\xFF\xFF\xFF\x7E\xFF\xFF\xFF\xFD\xFF\xFF\xFF\x50\x00\x00\x00\x00\xFF\xFF\xFF\x83\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7A\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x11\xFF\xFF\xFF\xD8\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x58\x00\x00\x00\x00\xFF\xFF\xFF\x7D\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x8C\x00\x00\x00\x00\xFF\xFF\xFF\x50\xFF\xFF\xFF\xFD\xFF\xFF\xFF\x7E\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x0E\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xE0\xFF\xFF\xFF\xFD\xFF\xFF\xFF\x1C\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x36\xFF\xFF\xFF\xFC\xFF\xFF\xFF\xE8\xFF\xFF\xFF\x01\xFF\xFF\xFF\x41\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xE3\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x0E\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x10\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xD1\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xB9\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x24\xFF\xFF\xFF\x0A\xFF\xFF\xFF\xFB\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x0E\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x28\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xB7\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x86\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x58\x00\x00\x00\x00\xFF\xFF\xFF\xCB\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x2A\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x7E\xFF\xFF\xFF\xC0\xFF\xFF\xFF\xBE\xFF\xFF\xFF\x50\xFF\xFF\xFF\x38\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xA8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x41\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x5D\x00\x00\x00\x00\xFF\xFF\xFF\xAE\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x32\xFF\xFF\xFF\x50\xFF\xFF\xFF\xBE\xFF\xFF\xFF\xC0\xFF\xFF\xFF\x7E\xFF\xFF\xFF\xD3\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x93\xFF\xFF\xFF\x1A\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xC6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x15\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xD9\xFF\xFF\xFF\xFC\xFF\xFF\xFF\x09\xFF\xFF\xFF\x93\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xD3\xFF\xFF\xFF\x06\xFF\xFF\xFF\x20\xFF\xFF\xFF\x1E\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xF5\xFF\xFF\xFF\xED\xFF\xFF\xFF\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x0A\xFF\xFF\xFF\xFD\xFF\xFF\xFF\xD7\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x1E\xFF\xFF\xFF\x20\xFF\xFF\xFF\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xB7\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x46\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x42\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xA9\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x55\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xAD\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x02\xFF\xFF\xFF\xCA\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x5A\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x30\xFF\xFF\xFF\xAC\xFF\xFF\xFF\x27\x00\x00\x00\x00\xFF\xFF\xFF\x06\xFF\xFF\xFF\xE3\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x50\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x65\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xC2\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x27\xFF\xFF\xFF\xAC\xFF\xFF\xFF\x30\x00\x00\x00\x00\xFF\xFF\xFF\x2F\xFF\xFF\xFF\xEE\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x4D\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x43\xFF\xFF\xFF\xFE\xFF\xFF\xFF\xEC\xFF\xFF\xFF\x17\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x14\xFF\xFF\xFF\xEC\xFF\xFF\xFF\xFB\xFF\xFF\xFF\x2D\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x4D\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xEE\xFF\xFF\xFF\x2F\xFF\xFF\xFF\x9C\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x90\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xAA\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xA7\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x8F\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x80\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x9C\xFF\xFF\xFF\x19\xFF\xFF\xFF\x42\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x0B\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x4E\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x4D\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xE5\xFF\xFF\xFF\x0D\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x42\xFF\xFF\xFF\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x51\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xB4\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xB4\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x55\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xEE\xFF\xFF\xFF\xF3\xFF\xFF\xFF\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x04\xFF\xFF\xFF\xF3\xFF\xFF\xFF\xF2\xFF\xFF\xFF\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xBF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x89\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x89\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xC1\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x95\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x96\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x90\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x9D\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x70\xFF\xFF\xFF\x9D\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x90\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x7F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x65\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x65\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x2E\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF3\xFF\xFF\xFF\xB3\xFF\xFF\xFF\xB0\xFF\xFF\xFF\xB0\xFF\xFF\xFF\xB0\xFF\xFF\xFF\xB0\xFF\xFF\xFF\xB0\xFF\xFF\xFF\xB0\xFF\xFF\xFF\xB3\xFF\xFF\xFF\xF3\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x2E\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x68\xFF\xFF\xFF\xF7\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF7\xFF\xFF\xFF\x68\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x77\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xB6\xFF\xFF\xFF\x30\xFF\xFF\xFF\x30\xFF\xFF\xFF\x30\xFF\xFF\xFF\x30\xFF\xFF\xFF\xB6\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x77\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x1A\xFF\xFF\xFF\xF4\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x76\xFF\xFF\xFF\x12\xFF\xFF\xFF\x12\xFF\xFF\xFF\x76\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF4\xFF\xFF\xFF\x1A\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x56\xFF\xFF\xFF\xFC\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFA\xFF\xFF\xFF\xFA\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFC\xFF\xFF\xFF\x56\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\x31\xFF\xFF\xFF\xB1\xFF\xFF\xFF\xE7\xFF\xFF\xFF\xE7\xFF\xFF\xFF\xB1\xFF\xFF\xFF\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'

local ffi = require 'ffi'
local vector = require 'vector'

ffi.cdef[[
    typedef struct { 
        float x; 
        float y; 
        float z;
    } nml_vec3_t;

    struct nml_ColorRGBExp32 {
        unsigned char r, g, b;
        signed char exponent;
    };
    
    struct nml_dlight_t {
        int flags;
        nml_vec3_t origin;
        float radius;
        struct nml_ColorRGBExp32 color;
        float die;
        float decay;
        float minlight;
        int key;
        int style;
        nml_vec3_t direction;
        float innerAngle;
        float outerAngle;
    };

    struct nml_dworldlight_t
    {
        nml_vec3_t origin;
        nml_vec3_t intensity;
        nml_vec3_t normal;
        nml_vec3_t shadow_cast_offset;
        int cluster;
        int type;
        int style;
        float stopdot;
        float stopdot2;
        float exponent;
        float radius;
        float constant_attn;
        float linear_attn;
        float quadratic_attn;
        int flags;
        int texinfo;
        int owner;
    };

    struct nml_worldbrushdata_t
    {
        char pad_0000[168]; //0x0000
        int32_t numworldlights; //0x00A8
        struct nml_dworldlight_t* worldlights; //0x00AC
        char pad_00B0[11888]; //0x00B0
    };
]]

local last_pos = ffi.new('nml_vec3_t')
local new_lights_table, lights = { }, { }

local alloc_dlight = vtable_bind('engine.dll', 'VEngineEffects001', 4, 'struct nml_dlight_t*(__thiscall*)(void*, int)')

local worldbrush_signature = client_find_signature('engine.dll', '\xA1\xCC\xCC\xCC\xCC\x0F\x84\xCC\xCC\xCC\xCC\x33')
local worldbrush_ptr, worldbrushdata = ffi.cast('int', worldbrush_signature) + 1

local function draw_dlight(data)
    local dlight = alloc_dlight(data.index)

    last_pos.x, last_pos.y, last_pos.z =
        data.origin.x, data.origin.y, data.origin.z

    dlight.key = data.index

    dlight.color.r = data.color[1]
    dlight.color.g = data.color[2]
    dlight.color.b = data.color[3]
    dlight.color.exponent = data.color[4] / 8.5

    dlight.flags = data.flags
    dlight.style = data.style
    dlight.direction = last_pos
    dlight.origin = last_pos
    dlight.radius = data.radius
    dlight.decay = data.radius / 5
    dlight.die = data.time
end

-- UI Elements
local master_switch = ui_new_checkbox('VISUALS', 'Effects', 'Luminus lights')
local color = ui_new_color_picker('VISUALS', 'Effects', '\n Lights Color', 39, 39, 39, 41)
local radius = ui_new_slider('VISUALS', 'Effects', 'Light radius', 0, 800, 95, true, 'ft')
local distance = ui_new_slider('VISUALS', 'Effects', 'Minimal distance to lights', 85, 850, 450)
local style = ui_new_slider('VISUALS', 'Effects', 'Light style', 1, 11, 1)
local flashlight = ui_new_hotkey('VISUALS', 'Effects', 'Flashlight')

local visualize = ui_new_checkbox('VISUALS', 'Other ESP', 'Visualize lights')
local visualize_color = ui_new_color_picker('VISUALS', 'Other ESP', '\n visualize_lights_color', 255, 255, 255, 220)

-- Variables & functions
local prop_name = 'm_fEffects'
local light_type = { [0] = '| Surface', [1] = '| Point', [2] = '| Spotlight', [3] = '| Skylight', [4] = '| Quakelight', [5] = '| Skyambient' }

local light_icon = renderer_load_rgba(icon, 32, 32)
local sorting_func = function(a, b) return a.distance < b.distance end
local clamp = function(val, min, max) return math_max(min, math_min(val, max)) end

-- Callbacks
local g_pre_render = function()
    new_lights_table = { }

    local me = entity_get_local_player()

    if me == nil or worldbrushdata == nil then
        worldbrushdata = ffi.cast('struct nml_worldbrushdata_t***', worldbrush_ptr)[0][0]
        lights = { }
        return
    end

    if worldbrushdata.numworldlights <= 0 then
        lights = { }
        return
    end

    local origin = vector(entity_get_origin(me))

    if ui_get(flashlight) and me ~= nil and entity_is_alive(me) then
        entity_set_prop(me, prop_name, bit_bor(entity_get_prop(me, prop_name), 4))
    end

    local dead_time = globals_curtime() + (globals_tickinterval() * 2)
    local color, style, distance, radius, count = 
        { ui_get(color) }, ui_get(style), 
        ui_get(distance), ui_get(radius), 0

    for i=0, worldbrushdata.numworldlights do
        local pLight = worldbrushdata.worldlights[i]

        if pLight ~= nil then
            local light_origin = vector(pLight.origin.x, pLight.origin.y, pLight.origin.z)
            local light_dst = (origin-light_origin):length2d()

            if light_dst < distance then
                new_lights_table[#new_lights_table+1] = {
                    id = i,
                    type = pLight.type,
                    distance = light_dst,
                    origin = light_origin,
                    radius = (distance - light_dst) / distance * radius
                }
            end
        end
    end

    if not ui_get(master_switch) or #new_lights_table <= 0 then
        return
    end

    table_sort(new_lights_table, sorting_func)

    for i=1, #new_lights_table do
        if i > 32 then
            break
        end

        local pLight = new_lights_table[i]

        draw_dlight({
            index = 5000+pLight.id,
            origin = pLight.origin,
            radius = pLight.radius,
            flags = 0x2,
            style = style,
            color = color,
            time = dead_time
        })
    end
end

local g_draw_lights = function()
    if not ui_get(visualize) or light_icon == nil then
        lights = { }
        return
    end

    local sptime = globals_frametime()
    local r, g, b, a = ui_get(visualize_color)
    local distance, huge = ui_get(distance), math.huge

    local me = entity_get_local_player()
    local origin = vector(entity_get_origin(me))

    for _, data in pairs(lights) do
        data.count = nil
    end

    for i=1, #new_lights_table do
        if i > 32 then
            break
        end

        local pLight = new_lights_table[i]

        if lights[pLight.id] == nil then
            lights[pLight.id] = {
                alpha = 0,
                text_size = 0
            }
        end

        lights[pLight.id].light = pLight
        lights[pLight.id].count = true
    end

    for _, data in pairs(lights) do
        local light_dst = data.count and (origin-data.light.origin):length2d() or huge
        local origin = { data.light.origin.x, data.light.origin.y, data.light.origin.z }

        local is_visible = client_visible(unpack(origin))

        local text_sp = (is_visible and light_dst < distance/2) and sptime or -sptime
        local sp, d = light_dst < distance and sptime or -sptime, false

        if light_dst < distance and data.alpha > 0.25 and not is_visible then
            sp, d = -sptime, true
        end

        data.alpha = clamp(data.alpha + sp*4, d and 0.25 or 0, 1)
        data.text_size = clamp(data.text_size + text_sp*4, 0, 1)

        if data.alpha > 0 then
            local x, y = renderer_world_to_screen(unpack(origin))

            if x ~= nil and y ~= nil then
                local text = light_type[data.light.type] or '| Unknown'
                local w, h = renderer_measure_text(nil, text)

                local offset = (data.text_size * w) / 2

                renderer_texture(light_icon, x - offset, y, 18, 18, r, g, b, data.alpha*a, 'f')

                if data.text_size > 0.05 then
                    renderer_text(x + 18 + 4 - offset, y+3, r, g, b, data.alpha*a, '', data.text_size*(w+1), text)
                end
            end
        end

        if data.alpha == 0 and data.text_size == 0 then
            lights[data.light.id] = nil
        end
    end
end

local ui_visibility = function()
    local state = ui_get(master_switch)

    ui_set_visible(radius, state)
    ui_set_visible(distance, state)
    ui_set_visible(style, state)
end

client_set_event_callback('pre_render', g_pre_render)
client_set_event_callback('paint', g_draw_lights)

ui_set_callback(master_switch, ui_visibility)
ui_visibility(master_switch)
