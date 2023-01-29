alias wft='watch_flutter_and_test'
alias wdt='watch_dart_and_test'
alias wrt='watch_rust_and_test'

function watch_flutter_and_test() {
  while true
  do
    # { git ls-files; git ls-files . --exclude-standard --others; } | entr -d flutter test
    ls -d **/*.dart | entr -d flutter test --coverage
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
