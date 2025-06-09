if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    fastfetch
    echo The date today is: (set_color cyan; date '+%Y-%m-%d')
end

function yt
    if test (count $argv) -gt 0
        set search_query (string join '+' $argv)
        open "https://www.youtube.com/results?search_query=$search_query"
    else
        open "https://www.youtube.com"
    end
end

alias ll "exa -lh"
alias la "exa -la"
alias cat "batcat"
