sudo yabai --load-sa
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

# global settings
yabai -m config mouse_follows_focus          off
yabai -m config focus_follows_mouse          off
yabai -m config window_origin_display        default
yabai -m config window_placement             second_child
yabai -m config window_topmost               off
yabai -m config window_shadow                on
yabai -m config window_opacity               off
yabai -m config window_opacity_duration      0.0
yabai -m config active_window_opacity        1.0
yabai -m config normal_window_opacity        0.90
yabai -m config window_border                off
yabai -m config window_border_width          6
yabai -m config active_window_border_color   0xff775759
yabai -m config normal_window_border_color   0xff555555
yabai -m config insert_feedback_color        0xffd75f5f
yabai -m config split_ratio                  0.50
yabai -m config auto_balance                 off
yabai -m config mouse_modifier               alt
yabai -m config mouse_action1                move
yabai -m config mouse_action2                resize
yabai -m config mouse_drop_action            swap

# general space settings
# bsp, stack or float
yabai -m config layout                       bsp
yabai -m config top_padding                  15
yabai -m config bottom_padding               15
yabai -m config left_padding                 15
# NOTE: for OBS floating head
# yabai -m config left_padding                 450
yabai -m config right_padding                15
yabai -m config window_gap                   15

# apps to not manage (ignore)
yabai -m rule --add label="Messages" app="^Messages$" manage=off
yabai -m rule --add label="App Store" app="^App Store$" manage=off
yabai -m rule --add label="Software Update" title="Software Update" manage=off
yabai -m rule --add label="About This Mac" app="^About This Mac" title="About This Mac" manage=off
yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
yabai -m rule --add label="Calculator" app="^Calculator$" manage=off
yabai -m rule --add label="Dictionary" app="^Dictionary$" manage=off
yabai -m rule --add app="^System Settings$" manage=off
yabai -m rule --add app="^Archive Utility$" manage=off
yabai -m rule --add app="Raycast" manage=off
yabai -m rule --add app="^Music$" manage=off

# signals
yabai -m signal --add event=application_front_switched action="${ubersicht_spaces_refresh_command}"
yabai -m signal --add event=display_changed action="${ubersicht_spaces_refresh_command}"
yabai -m signal --add event=space_changed action="${ubersicht_spaces_refresh_command}"
yabai -m signal --add event=window_created action="${ubersicht_spaces_refresh_command}"
yabai -m signal --add event=window_destroyed action="${ubersicht_spaces_refresh_command}"
yabai -m signal --add event=window_focused action="${ubersicht_spaces_refresh_command}"
yabai -m signal --add event=window_title_changed action="${ubersicht_spaces_refresh_command}"

echo "yabai configuration loaded.."
