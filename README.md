# vim-config

Vim is one of the most popular, configurable, extensible and powerful text editor.
The behavor can be customized by creating the configuration file, .vimrc. 

The global configuration file is located at `/etc/vim/vimrc.local`.
Users can create a `.vimrc` file in their home directory to extend / override the
global configuration.

Vim also support plugin. While there are many plugin managers for Vim, I prefer to use
[vim-plug](https://github.com/junegunn/vim-plug) for its simplicity and ease of use.

To install `vim-plug`, run the command 

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```bash
wget -O- https://raw.githubusercontent.com/vishalraj82/vim-config/master/vimrc > $HOME/.vimrc
```
