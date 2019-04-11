let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'go': ['golangci-lint'],
\   'proto': ['prototool-lint'],
\   'python': ['flake8', 'pylint'],
\   'markdown': ['prettier', 'alex'],
\   'json': ['prettier']
\}

let g:ale_fixers = {
\   'python': ['yapf', 'autopep8'],
\   'javascript': ['prettier'],
\   'javascript.jsx': ['prettier'],
\   'markdown': ['prettier'],
\   'go': ['goimports'],
\   'json': ['prettier']
\}

let g:ale_go_golangci_lint_options = "--no-config --fast -D staticcheck -D typecheck"
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

