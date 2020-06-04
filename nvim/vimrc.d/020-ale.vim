let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'go': ['golangci-lint'],
\   'proto': ['prototool-lint'],
\   'python': ['flake8', 'pylint'],
\   'markdown': ['prettier', 'alex'],
\   'json': ['prettier'],
\   'yaml': ['cloudformation'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf', 'autopep8'],
\   'javascript': ['prettier'],
\   'javascript.jsx': ['prettier'],
\   'markdown': ['prettier'],
\   'go': ['goimports'],
\   'json': ['prettier'],
\   'yaml': ['cloudformation'],
\}

let g:ale_go_golangci_lint_options = "--no-config --fast -D staticcheck -D typecheck"
let g:ale_go_golangci_lint_package = 1
let g:ale_fix_on_save = 1
