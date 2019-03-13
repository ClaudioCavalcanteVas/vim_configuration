all: sym_link

sym_link:
	@echo "Binding the vim rc file to user's folder"
	@ln -s $(pwd)/.vimrc ~/.vimrc
