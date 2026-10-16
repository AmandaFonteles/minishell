# MiniShell

A small Bash-like shell written in C as part of the 42 Paris common core.
`minishell` reads a command line with GNU Readline, tokenizes and parses it,
expands variables, sets up redirections, heredocs and pipes, and runs either a
built-in or an external program — with the same exit codes and signal behaviour
you would expect from Bash.

```
minishell$> echo "hi $USER" | cat -e
hi amanda$
minishell$> ls nope
ls: cannot access 'nope': No such file or directory
minishell$> echo $?
2
```

---

## Features

**Prompt & history**
- Interactive prompt (`minishell$> `) with command history (`readline` / `add_history`)
- `Ctrl-D` on an empty line exits the shell

**Parsing**
- Single quotes (no expansion) and double quotes (expansion of `$`)
- Environment variable expansion: `$VAR`, `$?`
- Pipes `|`, including detection of empty / consecutive pipes (`ls | |`)
- Redirections: `<`, `>`, `>>` and heredoc `<<` (with expansion inside heredocs)
- Syntax error detection with Bash-compatible messages and exit code `2`

**Execution**
- `PATH` lookup and `execve` of external commands, with `command not found` (127)
  and permission (126) handling
- Pipelines of any length (one child process per command, pipe file descriptors
  managed by the parent)
- A single built-in runs in the parent process (so `cd`, `export`, `exit`… affect
  the shell itself); built-ins inside a pipeline run in a child
- Heredocs are collected before execution and written to temporary files

**Built-ins**

| Command  | Behaviour |
|----------|-----------|
| `echo`   | with `-n` |
| `cd`     | relative/absolute path, `cd` → `$HOME`, `cd -` → `$OLDPWD`; updates `PWD`/`OLDPWD` |
| `pwd`    | no options |
| `export` | no options; lists exported variables when called without arguments, identifier validation |
| `unset`  | no options; identifier validation |
| `env`    | no options or arguments |
| `exit`   | optional numeric status, `numeric argument required` / `too many arguments` errors |

**Signals**
- `Ctrl-C` shows a fresh prompt and sets `$?` to 130
- `Ctrl-\` is ignored at the prompt
- Children get default signal behaviour back; heredocs have their own `Ctrl-C` / `Ctrl-D` handling
- A single global (`g_exit_flag`) carries the last exit status, as allowed by the subject

---

## Build & run

Requirements: `cc`, `make` and the GNU Readline development headers
(`libreadline-dev` on Debian/Ubuntu).

```sh
make          # builds libft, then ./minishell
./minishell
```

Other targets: `make clean`, `make fclean`, `make re`.

---

## How it works

```
readline ──► parse_input ──► ft_tokenise ──► expansion ──► setup_exec ──► builtin / execve
             (split on |,     (tokens +       ($VAR, $?,    (heredocs,
              syntax check)    types)          quotes)       redirs, pipes,
                                                             fork/wait)
```

1. **`parsing/parse.c`** – checks quotes and pipe syntax, splits the line on `|`
   (quote-aware `ft_shell_split`) and builds one `t_pars_cmd` per command.
2. **`parsing/tokenization.c` + `token_utils*.c`** – splits each command into
   `t_token`s and assigns a type (`ARG`, `FILE_IN`, `HERE_DOC`, `FILE_OUT`,
   `FILE_OUT_SUR`, `LIMITOR`, …).
3. **`parsing/expend*.c`** – expands `$VAR` / `$?` according to the quoting
   context, then removes quotes.
4. **`parsing/redir_utils.c`, `heredoc_parsing.c`** – fill `infile`, `outfile`,
   `append`, heredoc delimiters and the final `args` array of each command.
5. **`src/setup_exec.c`** – entry point of execution: prepares heredocs, then
   dispatches to a single built-in (`builtins.c`), a single external command
   (`uniq_cmd.c`) or a pipeline (`pipes.c`, `processes*.c`).
6. **`src/execve_hub*.c`** – resolves the binary through `PATH` and calls `execve`.

Main data structures (`inc/structs.h`, `inc/token.h`):

- `t_minishell` – global state: input line, `envp`, environment lists, command list, pipes
- `t_pars_cmd` – one command of the pipeline: args, tokens, redirections, heredocs, pid
- `t_env` – linked list for the environment and the export list
- `t_token` – a word and its type

---

## Project structure

```
.
├── Makefile
├── inc/
│   ├── minishell.h     # main header, prototypes for execution
│   ├── structs.h       # shared data structures
│   └── token.h         # token types + parsing prototypes
├── parsing/            # lexer, parser, expansion, syntax errors, parsing cleanup
├── src/                # main loop, init, built-ins, env, execution, pipes,
│                       # redirections, heredocs, signals, errors, cleanup
└── libft/              # personal libft (+ ft_printf, get_next_line)
```

---

## Contributors

This project was built by two students. The split was clean: **Amanda owned
execution, built-ins and the environment**, **Adrien owned the parser and
signals**, and both met in the middle to connect parsing to execution and hunt
down leaks, fd issues and Norminette errors.

### Amanda Fonteles — execution, built-ins & environment

- **Project setup**: repository, `Makefile`, `inc/minishell.h` and `inc/structs.h`
  (the `t_minishell`, `t_pars_cmd`, `t_env` structures), and the bundled `libft`
- **Initialisation** (`init.c`): copying `envp` into the `t_env` lists used by
  `env` and `export`
- **All seven built-ins**: `echo`, `cd` (including `cd -` and `$HOME`), `pwd`,
  `export` (listing, identifier checks), `unset`, `env`, `exit`
  (`builtins.c`, `builtin_utils*.c`, `cd.c`, `env_exp*.c`, `env_management.c`,
  `pwd_echo_unset.c`, `exit.c`)
- **Execution engine**: `setup_exec.c`, single command (`uniq_cmd.c`), `PATH`
  resolution and `execve` (`execve_hub*.c`), multi-command pipelines and child
  processes (`pipes.c`, `processes*.c`)
- **Redirections** (`redirections*.c`) and **heredoc execution** (`heredoc*.c`:
  temporary files, reading them back, cleanup)
- **Exit status**: introduced the global exit-code variable and fixed many
  Bash-compatibility cases (`command not found`, syntax error code, `unset PATH`
  then running a command, invalid identifiers)
- **Error handling & memory** (`error*.c`, `free*.c`): safe wrappers, freeing in
  child processes, double-free and fd-leak fixes (`cd`, `unset`, exit path)
- Large share of the final **Norminette** pass on the execution side

### Adrien Régis — parsing, expansion & signals

- **Lexer and tokenizer**: quote-aware splitting on pipes and spaces, token
  creation and typing (`parse.c`, `parse_utils*.c`, `tokenization.c`,
  `token_utils*.c`, `inc/token.h`)
- **Syntax checking**: unclosed quotes, consecutive/empty pipes, invalid
  redirections, directory checks (`syntax_check.c`, `error_pars*.c`)
- **Variable expansion**: `$VAR`, `$?`, single vs. double quote rules and quote
  removal (`expend.c`, `expend_d.c`, `expend_utils*.c`)
- **Redirection & heredoc parsing**: filling `infile`/`outfile`/`append` and
  heredoc delimiters on each command (`redir_utils.c`, `heredoc_parsing.c`),
  expansion inside heredocs
- **Connecting parsing to execution**: making the parser produce the
  `t_pars_cmd` list the executor consumes (`process_input`)
- **Signals** (`signals.c`): prompt, child-process and heredoc handlers,
  `Ctrl-C` / `Ctrl-D` in heredocs
- **Readline integration**: history handling and readline leak fixes
- **Parser rewrite** ("from scratch" branch, June 2025) that fixed pipe and
  redirection edge cases
- Test scripts used during development, parsing-side memory cleanup
  (`free_parse*.c`) and the parsing **Norminette** pass

### Shared work

- Pull-request workflow: features developed on branches (`amanda`, `from-scratch`,
  `test-redir`, `sig-hd`, `norminette-check`, …) and merged through ~40 PRs
- Joint debugging of leaks, file descriptors and Bash edge cases, especially
  around heredocs + signals
- Final Norminette compliance across the codebase

---

## Resources

- `man bash`, sections on quoting, expansion, redirection and pipelines
- GNU Readline documentation
- The 42 minishell subject