Vim�UnDo� %,��qa�"<�s�!�����SS)��u)���  �                                  cM��    _�                     �        ����                                                                                                                                                                                                                                                                                                                                                          cM�b     �   �   �  �       5��    �                      }                     5�_�                   �       ����                                                                                                                                                                                                                                                                                                                                                          cM��     �   �   �          local 5��    �                      }                     5�_�                     �       ����                                                                                                                                                                                                                                                                                                                                                          cM��    �   �   �  �    5��    �                      }                     5�_�                   �       ����                                                                                                                                                                           [                                                                                                                                                                               cM��     �   �   �  �   @   0local function scheme_for_appearance(appearance)   !	if appearance:find("Light") then   "		return "Solarized Dark (base16)"   "		-- return "Catppuccin Macchiato"   	else   		-- return "Catppuccin Frappe"   		return "Solarized Darker"   	end   end       <wezterm.on("window-config-reloaded", function(window, _pane)   6	local overrides = window:get_config_overrides() or {}   +	local appearance = window:get_appearance()   1	local scheme = scheme_for_appearance(appearance)   )	if overrides.color_scheme ~= scheme then   !		overrides.color_scheme = scheme   (		window:set_config_overrides(overrides)   	end   end)       6if wezterm.target_triple == "x86_64-apple-darwin" then   =	wezterm.on("window-config-reloaded", function(window, _pane)   ,		local appearance = window:get_appearance()   "		if appearance:find("Light") then   8			local overrides = window:get_config_overrides() or {}   0			overrides.font = wezterm.font_with_fallback({   				"SF Mono",   				"Roboto Mono",   				"DejaVu Sans Mono",   				"Ubuntu Mono",   				"Menlo",   				"Consolas",   				"Liberation Mono",   				"Courier",   			})   )			window:set_config_overrides(overrides)   		end   	end)   end       <wezterm.on("window-config-reloaded", function(window, _pane)   6	local overrides = window:get_config_overrides() or {}   +	local appearance = window:get_appearance()   1	local scheme = scheme_for_appearance(appearance)   )	if overrides.color_scheme ~= scheme then   !		overrides.color_scheme = scheme   (		window:set_config_overrides(overrides)   	end   end)       6if wezterm.target_triple == "x86_64-apple-darwin" then   =	wezterm.on("window-config-reloaded", function(window, _pane)   ,		local appearance = window:get_appearance()   "		if appearance:find("Light") then   8			local overrides = window:get_config_overrides() or {}   0			overrides.font = wezterm.font_with_fallback({   				"SF Mono",   				"Roboto Mono",   				"DejaVu Sans Mono",   				"Ubuntu Mono",   				"Menlo",   				"Consolas",   				"Liberation Mono",   				"Courier",5��    �              ?      �              A      5�_�                     �       ����                                                                                                                                                                           [                                                                                                                                                                               cM��     �   �   �  �      				"Courier"u,5��    �                     �                     5��