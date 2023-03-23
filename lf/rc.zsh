# Basic Settings
set hidden true
set preview true
set drawbox true
set ignorecase true
set icons true

# Custom Functions
cmd mkdir ${{
  printf "Directory Name: "
  read ans
  mkdir $ans
}}

cmd mkfile ${{
  printf "File Name: "
  read ans
  touch $ans
}}

cmd chmod ${{
  printf "Mode Bits: "
  read ans

  for file in "$fx"
  do
    chmod $ans $file
  done
}}

# cmd setwallpaper %cp "$f" ~/.config/wall.jpg && xwallpaper --zoom "$f"

cmd trash ${{
  trash-put "$f"
}}

cmd fzf_jump ${{
  res="$(find . -maxdepth 3 | fzf --reverse --header='Jump to location')"
  if [ -f "$res" ]; then
    cmd = "select"
  elif [ -d "$res" ]; then
    cmd="cd"
  fi
  lf -remote "send $id $cmd \"$res\""
}}

# Archive bindings
cmd unarchive ${{
  case "$f" in
      *.zip) unzip "$f" ;;
      *.tar.gz) tar -xzvf "$f" ;;
      *.tar.bz2) tar -xjvf "$f" ;;
      *.tar) tar -xvf "$f" ;;
      *) echo "Unsupported format" ;;
  esac
}}

# Trash bindings
cmd trash ${{
  files=$(printf "$fx" | tr '\n' ';')
  while [ "$files" ]; do
    file=${files%%;*}

    trash-put "$(basename "$file")"
    if [ "$files" = "$file" ]; then
      files=''
    else
      files="${files#*;}"
    fi
  done
}}

cmd restore_trash ${{
  trash-restore
}}

cmd clear_trash %trash-empty

cmd open &{{
	mimetype=$(file --brief --dereference --mime-type $f)
	defapp=$(xdg-mime query default $mimetype)
	case "$defapp" in
	nvim.desktop)
        lf -remote "send $id \$nvim $f"
		;;
	vim.desktop)
        lf -remote "send $id \$vim $f"
		;;
	*)
		open $f
	esac
}}

# Bindings
# Remove some defaults
map m
map o 
map n
map "'"
map '"'
map d

map au unarchive

# Basic Functions
map o &mimeopen $f
map O &mimeopen --ask $f
map . set hidden!
map DD trash
map p paste
map x cut
map y copy
map <enter> open
map R reload
map mf mkfile
map md mkdir
map ch chmod
map bg setwallpaper
map C clear

map f fzf_jump
map dd trash
map dr restore_trash
map ee $$EDITOR "$f"

# Movement
map gd cd ~/documents
map gD cd ~/downloads
map gp cd ~/pictures
map gc cd ~/.config
map gr cd ~/repos
map gv cd ~/videos/recordings
map gs cd ~/.local/bin
map gt cd ~/.local/share/Trash/files
