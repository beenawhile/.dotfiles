# focus window
alt - h : yabai -m window --focus west
alt - j : yabai -m window --focus south
alt - k : yabai -m window --focus north
alt - l : yabai -m window --focus east

alt - y : yabai -m space --mirror y-axis
alt - x : yabai -m space --mirror x-axis

# swap managed window
shift + alt - h : yabai -m window --swap west
shift + alt - j : yabai -m window --swap south
shift + alt - k : yabai -m window --swap north
shift + alt - l : yabai -m window --swap east

# move window and split
ctrl + alt - h : yabai -m window --warp west
ctrl + alt - j : yabai -m window --warp south
ctrl + alt - k : yabai -m window --warp north
ctrl + alt - l : yabai -m window --warp east

# rotate tree
alt - r : yabai -m space --rotate 90

# toggle window fullscreen zoom
alt - f : yabai -m window --toggle zoom-fullscreen

# toggle padding and gap
alt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

# float / unfloat window and center on screen
alt - t : yabai -m window --toggle float;\
          yabai -m window --grid 4:4:1:1:2:2

# toggle window split type
alt - e : yabai -m window --toggle split

# balance size of windows
shift + alt - e : yabai -m space --balance

# move window and focus desktop
shift + alt - p : yabai -m window --space prev
shift + alt - n : yabai -m window --space next
shift + alt - 1 : yabai -m window --space 1
shift + alt - 2 : yabai -m window --space 2
shift + alt - 3 : yabai -m window --space 3
shift + alt - 4 : yabai -m window --space 4
shift + alt - 5 : yabai -m window --space 5
shift + alt - 6 : yabai -m window --space 6
shift + alt - 7 : yabai -m window --space 7
shift + alt - 8 : yabai -m window --space 8
shift + alt - 9 : yabai -m window --space 9
shift + alt - l : yabai -m window --space last

# start/stop yabai
ctrl + alt - q : brew services stop yabai
ctrl + alt - s : brew services start yabai
