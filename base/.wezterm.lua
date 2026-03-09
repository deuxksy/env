local wezterm = require 'wezterm'
local config = {}

-- -- Hack Nerd Font 설정 및 리가처(Ligatures) 활성화
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 12.0
-- config.font_ligatures = true

return config
