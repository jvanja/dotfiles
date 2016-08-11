##Useful Vim [Cheat Sheet](http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html)

###NORMAL MODE

####searching

| Command                    | Description                                                                                           |
| ---                        | :---                                                                                                  |
| :Ag /SEARCH/g *\*/\*       | -search for SEARCH term from current folder recursively                                               |
| :copen                     | Open the quickfix window for search results                                                           |                         
| :ccl                       | close it                                                                                              |
| :cw                        | Open it if there are "errors", close it otherwise (some people prefer this)                           |
| :cn                        | Go to the next error in the window                                                                    |
| :cnf                       | Go to the first error in the next file                                                                |
| :cdo /foo/bar/c \| update  | search and replace over each element from quickfix list                                               |
| :cfdo /foo/bar/c \| update | search and replace over each file from quickfix list (will not run replace mutiple times over 1 file) |

####pasting

| Command | Description                                               |
| ---     | :---                                                      |
| “0p-    | paste from YANK only register (does not remember DdXxCc…) |
| “ayy-   | yank line to register a                                   |
| “Ayy    | append line to register a                                 |
| “ap     | paste from register a                                     |

####registers

| Command | Description                                 |
| ---     | :---                                        |
| :reg-   | access all currently defined registers type |

####folds

| Command | Description      |
| ---     | :---             |
| za      | toggle fold      |
| zA      | toggle all folds |
| zR      | open all folds   |

####markers

| Command   | Description                                                      |
| ---       | :---                                                             |
| m[a-zA-Z] | set marker [a-zA-Z]. If capital letter used it’s cross files!    |
| `[a-zA-Z] | go to marker [a-zA-Z]                                            |
| '[a-zA-Z] | go to the line of the marker [a-zA-Z]. This is faster to type... |
| `[        | go to the beginning of the last changed text (auto set)          |
| `[        | go to the end of the last changed text (auto set)                |

####buffers

| Command | Description                   |
| ---     | :---                          |
| :b#     | open previously opened buffer |

####macros

| Command            | Description                  |
| ---                | :---                         |
| q&lt;commands&gt;q | To record a macro "q"        |
| &lt;1-9&gt;@q      | To execute the macro** “**q" |
| @@                 | replay last used macro       |

####panes

| Command       | Description                                      |
| ---           | :---                                             |
| ctrl w+[v,h]  | split window hor of vert with the current buffer |
| ctrl w+c      | close current split window                       |
| ctrl w+r      | swap (replace) panes                             |

####ctrl p

| Command           | Description        |
| ---               | :---               |
| ctrl v (ctrl s)   | open in split move |

####NerdTree

| Command | Description                                               |
| ---     | :---                                                      |
| go      | while in NerdTree go will open file without focusin on it |

####jumps

| Command | Description                                  |
| ---     | :---                                         |
| ctrl O  | jump back to the previous (older) location   |
| ctrl I  | jump forward to the next (newer) location    |
| :jumps  | display the jump list for the current window |

####other

| Command  | Description                                                                              |
| ---      | :---                                                                                     |
| :r !ls   | to print external “ls” below cursor.. you can print file contents also e.g. ":r foo.txt” |
| ctrl a   | increment a number under cursor                                                          |
| :lcd %:h | set the local directory to the folder containing the current open file                   |

###INSERT MODE

####insertion

| Command    | Description                 |
| ---        | :---                        |
| ctrl r     | insert text from a register |
| ctrl a     | insert last inserted text   |

####completion

| Command              | Description                                                                                                   |
| ---                  | :---                                                                                                          |
| ctrl p               | completion based on previous ‘p’                                                                              |
| ctrl x ctrl f        | completion for file names in an open project! **MIND EXPLODED  (ctrl x - completion mode; ctrl f for files)** |
| ctrl x ctrl n (or p) | context aware completion. goes ahead (or before) and completes from the context                               |
| ctrl x ctrl l        | context aware LINE completion.                                                                                |

###VISUAL BLOCK MODE

| Command     | Description             |
| ---         | :---                    |
| ctrl v      | enter visual block mode |
| shift i     | prepend text to block   |


##Useful TMUX [Cheat Sheet](https://gist.github.com/MohamedAlaa/2961058)

**ctrl+a** and then:

**Windows**

c  create window

w  list windows

n  next window

p  previous window

f  find window

,  name window

&  kill window

**TMUX RESURECT**

ctrl s  save sessions

ctrl r  restore sessions

**Panes (splits)**

%  vertical split

"  horizontal split

o  swap panes

x  kill pane
