set -g __fish_git_prompt_show_informative_status 1 
set -g __fish_git_prompt_hide_untrackedfiles 1 
set -g __fish_git_prompt_color_branch magenta bold 
set -g __fish_git_prompt_showupstream "informative" 
set -g __fish_git_prompt_char_upstream_ahead "↑" 
set -g __fish_git_prompt_char_upstream_behind "↓" 
set -g __fish_git_prompt_char_upstream_prefix "" 
set -g __fish_git_prompt_char_stagedstate "●" 
set -g __fish_git_prompt_char_dirtystate "✚" 
set -g __fish_git_prompt_char_untrackedfiles "…" 
set -g __fish_git_prompt_char_conflictedstate "✖" 
set -g __fish_git_prompt_char_cleanstate "✔" 
set -g __fish_git_prompt_color_dirtystate blue 
set -g __fish_git_prompt_color_stagedstate yellow 
set -g __fish_git_prompt_color_invalidstate red 
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal 
set -g __fish_git_prompt_color_cleanstate green bold



function fish_prompt
set -l last_status $status

	and set retc green; or set retc red
    tty|grep -q tty; and set tty tty; or set tty pts

    set_color $retc
    if [ $tty = tty ]
        echo -n .-
    else
        echo -n '┬─'
    end
    set_color -o green
    echo -n [
    if [ $USER = root ]
        set_color -o red
    else
        set_color -o yellow
    end
    echo -n $USER
    set_color -o white
    echo -n @
    if [ -z "$SSH_CLIENT" ]
        set_color -o blue
    else
        set_color -o cyan
    end
    echo -n (hostname)
    set_color -o white
    #echo -n :(prompt_pwd)
    echo -n :(pwd|sed "s=$HOME=~=")
    set_color -o green
    echo -n ']'
    set_color normal
    set_color $retc
    if [ $tty = tty ]
        echo -n '-'
    else
        echo -n '─'
    end
    set_color -o green
    echo -n '['
    set_color normal
    set_color $retc
    echo -n (date +%X)
    set_color -o green
    echo -n ]
    
    # Check if acpi exists
    if not set -q __fish_nim_prompt_has_acpi
    	if type acpi > /dev/null
    		set -g __fish_nim_prompt_has_acpi ''
    	else
    		set -g __fish_nim_prompt_has_acpi '' # empty string
    	end
    end
    	
    if test "$__fish_nim_prompt_has_acpi"
		if [ (acpi -a 2> /dev/null | grep off) ]
			echo -n '─['
			set_color -o red
			echo -n (acpi -b|cut -d' ' -f 4-)
			set_color -o green
			echo -n ']'
		end
	end
	set_color normal 
	printf '%s ' (__fish_git_prompt) 
	if not test $last_status -eq 0 
		set_color $fish_color_error 
	end 
    echo
    set_color normal
    for job in (jobs)
        set_color $retc
        if [ $tty = tty ]
            echo -n '; '
        else
            echo -n '│ '
        end
        set_color brown
        echo $job
    end
    set_color normal
    set_color $retc
    if [ $tty = tty ]
        echo -n "'->"
    else
        echo -n '╰─>'
    end
    set_color -o red
    echo -n '$ '
    set_color normal
end
