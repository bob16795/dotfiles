function fish_prompt
    # This is a simple prompt. It looks like
    # alfa@nobby /path/to/dir $
    # with the path shortened and colored
    # and a "#" instead of a "$" when run as root.
    set -l symbol ' >>> '
    set -l color $fish_color_cwd
    if fish_is_root_user
        set symbol ' >>> '
        set -q fish_color_cwd_root
        and set color $fish_color_cwd_root
    end

    set_color red
    echo -n (date +%H:%M)" "
    set_color normal
    echo -n (prompt_pwd)
    
    set_color blue
    echo -n $symbol
    set_color normal
end

function fish_command_not_found
    cd $argv[1]
end
