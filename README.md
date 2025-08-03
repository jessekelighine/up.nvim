# up.nvim

A Neovim plugin to navigate ***up*** the directory tree. This plugin is inspired
by the shell command [`up`](https://github.com/shannonmoeller/up) that allows
you to navigate up the directory structure easily.

> [!NOTE]
> This plugin only work with Unix-like systems. Modifications to make it
> work on other systems are welcome.

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim) and recommended keymap:

```lua
{
    "jessekelighine/up.nvim",
    config = function() require"up".map("<C-U>") end
}
```

This pluging provides the `Up` command with no default key mappings. You can
define a custom keymap with the function `require"up".map`. The config shown
above maps `<C-U>` in normal mode to the `Up` command.

## Usage

The `Up` command changes directory to a parent directory, depending on the argument:

- If no argument is provided, it will go up one directory.
- If an argument is provided, it will go up to the first parent directory whose name starts with the input.

## Examples

Suppose that you are in the directory `/home/user/projects/project/src/main.lua`.

- If you run the command `:Up`, it will change the current working directory to `/home/user/projects/project`
- If you run `:Up pro`, it will change the current working directory to `/home/user/projects/project`.
- If you want to go up to the `/home/user/projects` directory, you can type `:Up pro` and press `<Tab>` for completion.
- If you run `:Up ~`, it will change the current working directory to `/home/user`.
- If you run `:Up /`, it will change the current working directory to `/`.

## License

Distributed under the same terms as Vim itself. See `:help license`.
