function fish_greeting
end

function fish_prompt
    # Arch logo (U+F303, requires a Nerd Font)
    set_color cyan
    echo -n ' '

    # Get the current directory, then extract the last word
    set dir (basename (pwd))
    set_color '#ebbcba'
    echo -n $dir

    # Reset color and add space before command input
    set_color normal
    echo -n ' '
end

function fish_right_prompt
	printf '%s' (fish_git_prompt)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
