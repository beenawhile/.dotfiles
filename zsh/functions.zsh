alias wft='watch_flutter_and_test'
alias wdt='watch_dart_and_test'
alias wrt='watch_rust_and_test'
alias fhl='flutter_hotreload'
alias fhs='flutter_hotrestart'
alias fr='flutter_run'

function watch_flutter_and_test() {
  while true
  do
    # { git ls-files; git ls-files . --exclude-standard --others; } | entr -d flutter test
    ls -d **/*.dart | entr -d flutter test --coverage --test-randomize-ordering-seed random
  done
}

function watch_dart_and_test() {
  while true
  do
    ls -d **/*.dart | entr -d dart test
  done
}

function watch_rust_and_test() {
  while true
  do
    ls -d **/*.dart | entr -d cargo test
  done
}

function flutter_hotreload() {
  while true
  do
    find "$PWD"/lib -iname "*.dart" | entr -d -p kill -USR1 $(cat /tmp/flutter.pid)
  done
}

function flutter_hotrestart() {
  while true
  do
    find "$PWD"/lib -iname "*.dart" | entr -d -p kill -USR2 $(cat /tmp/flutter.pid)
  done
}

function flutter_run() {
  device=$(flutter devices | sed -n -e '3,$p' -r -e 's/[ \t]*//' | gum choose | awk -F '•' '{ print $2 }' | sed  's/^[t ]*//g;s/[t ]*$//g')
  flutter run -d $device --pid-file=/tmp/flutter.pid
}
