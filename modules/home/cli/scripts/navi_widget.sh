_navi_call() {
    local result="$(navi "$@" </dev/tty)"
    printf "%s" "$result"
}

_navi_widget() {
    local -r input="${LBUFFER}"
    local -r last_command="$(echo "${input}" | navi fn widget::last_command)"
    local replacement="$last_command"

    if [ -z "$last_command" ]; then
        replacement="$(_navi_call --print)"
    else
        replacement="$(_navi_call --print --query "$last_command")"
    fi

    if [ -n "$replacement" ]; then
        local -r find="${last_command}_NAVIEND"
        previous_output="${input}_NAVIEND"
        previous_output="${previous_output//$find/$replacement}"
    else
        previous_output="$input"
    fi

    zle kill-whole-line
    LBUFFER="${previous_output}"
    region_highlight=("P0 100 bold")
    zle redisplay
}

zle -N _navi_widget
bindkey '^g' _navi_widget
