all: sym_link

sym_link:
	@echo "Binding the vim rc file to user's folder"
	@ln -s $(pwd)/.vimrc ~/.vimrc
	
build:
	@docker build --tag=my-vim --build-arg 'VIM_VERSION=v8.0.0000' base

run:
	@docker run -v $(pwd):/projects -it my-vim
