lsp:
	go install golang.org/x/tools/gopls@latest
	go install golang.org/x/tools/cmd/goimports@latest
	go install mvdan.cc/gofumpt@latest
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	sudo npm install -g typescript typescript-language-server
	sudo npm install -g prettier eslint
	sudo npm install -g svelte-language-server
	sudo npm install -g @tailwindcss/language-server
	sudo npm install -g vscode-langservers-extracted
	sudo npm install -g emmet-ls
