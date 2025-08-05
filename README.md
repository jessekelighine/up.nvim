# up.nvim

A Neovim plugin to navigate ***up*** the directory tree. This plugin is inspired
by the shell command [`up`](https://github.com/shannonmoeller/up) that allows
you to navigate up the directory structure easily.

> [!NOTE]
> This plugin only work with Unix-like systems. Modifications to make it
> work on other systems are welcome.

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "jessekelighine/up.nvim",
    config = function() require"up".map("<C-U>") end
}
```

This pluging provides the `Up` command with no default keybinding. You can
define a custom keymap with the function `require"up".map`. The config shown
above maps `<C-U>` in normal mode to the `Up` command.

## Usage

The `Up` command changes directory to a parent directory, depending on the argument:

- If no argument is provided, it will go up one directory.
- If an argument is provided, it will go up to the first parent directory whose name starts with the input.

## Examples

Suppose that you are editing the file `~/.dotfiles/home/.config/nvim/pack/main/start/plugin/lua/module.lua`.

- If you run `:Up`, it will change the current working directory to `~/.dotfiles/home/.config/nvim/pack/main/start/plugin`
- If you run `:Up nv`, it will change the current working directory to `~/.dotfiles/home/.config/nvim`.
- If you want to go up to the `~/.dotfiles/home/.config/nvim/pack` directory,
  you can either `:Up pa` or type `:Up p` and press `<Tab>` for completion.
- If you run `:Up ~`, it will change the current working directory to `~`.
- If you run `:Up /`, it will change the current working directory to `/`.

## License

Distributed under the same terms as Vim itself. See `:help license`.
