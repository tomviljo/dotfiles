eval "$(starship init zsh)"

set_window_title() {
    echo -ne "\033]0;$(basename "$PWD")\007"
}
precmd_functions+=(set_window_title)
