-- Odyssey: theme-scoped appearance, reset by switching themes.
local border = { colors = { "rgba(66e5ffff)", "rgba(7fbaffff)", "rgba(b89affff)" }, angle = 45 }
hl.config({
  general = { gaps_in = 6, gaps_out = 12, border_size = 3,
    col = { active_border = border, inactive_border = "rgba(345574aa)" } },
  decoration = { rounding = 16,
    shadow = { enabled = true, range = 24, render_power = 3, color = "rgba(168ab544)" },
    blur = { enabled = true, size = 6, passes = 2 } },
  group = { col = { border_active = border, border_inactive = "rgba(345574aa)" } }
})
