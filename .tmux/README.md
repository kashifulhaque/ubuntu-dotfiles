## tmux keybinds

**Leader button:** `ctrl + s`

#### Create a new window
```bash
<leader> + c
```

#### Cycle through windows
```bash
<leader> + n
```

#### Switch to a particular window
```bash
<leader> + <number>
```
Example: `<leader> + 1` to go to window #1

### Split windows

#### Horizontal split
```bash
<leader> + %
```

#### Vertical split
```bash
<leader> + "
```

#### Cycle through windows
```bash
<leader> + <arrow-keys>
```

### Command mode
```bash
<leader> + :
```

#### Rename current window
```bash
<leader> + :
:rename-window <new-name>
```

#### Detach from tmux
```bash
<leader> + d
```

#### How to re-attach?

1. **To view the list of sessions**
```bash
tmux ls
```

2. **To re-attach to previous session**
```bash
tmux attach
```

3. **To create a new session**
> Detach from current session, and type the following
```bash
tmux
```

#### List all the sessions
```bash
<leader> + s
```

#### Rename current session
```bash
<leader> + :
:rename-session <session-name>
```

#### To install plugins using tpm
> Add the plugins to `~/.tmux.conf` file
```bash
<leader> + I (capital eye)
```
