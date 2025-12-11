eval "$(/opt/homebrew/bin/brew shellenv)"

set --universal pure_show_system_time true
set --universal pure_color_system_time pure_color_mute

set -gx CUDA_DEVICE_ORDER PCI_BUS_ID
set -x PATH $PATH $HOME/.local/bin
set -gx TERM xterm-256color
set -gx WORK "$HOME/Work"
set -gx EDITOR "vim"
set -gx VISUAL "vim"
set -gx GIT_EDITOR "vim"
set -gx HOMEBREW_EDITOR vim
set fish_command_timer_success_color green
set fish_command_timer_fail_color red
set fish_command_timer_color yellow
set fish_command_timer_millis 0
set fish_command_timer_export_cmd_duration_str 1
set fish_greeting
fish_vi_key_bindings

abbr userspack "source ~/spack/share/spack/setup-env.fish"
abbr fishconfig "vi ~/.config/fish/config.fish"
abbr dl "cd ~/Downloads"
abbr o "open ."
abbr mv "mv -iv"
abbr mkdir "mkdir -vp"
abbr rm "rm -vI"
abbr roe "rm *.out *.err"
abbr pip "pip3"
abbr python "python3"
abbr ipy "iPython"
abbr loc "git ls-files | xargs wc -l"
abbr ducks "du -cks * $(ls -A)| sort -rn | head -n 11"
abbr nuke "killall -9"
abbr cdh "cd $HOME"
abbr cdw "cd $WORK"
abbr pipremove "pip uninstall -y -r <(pip freeze)"
abbr pipreinstall "pip uninstall -y -r <(pip freeze) && pip install -r requirements.txt"
abbr lt "du -sh * | sort -h"
abbr left "ls -F --group-directories-first --color=auto -t -1"
abbr count "find . -type f | wc -l"
abbr untar "tar -zxvf"
abbr ll "ls -la"
abbr gs "git status"
abbr gb "git branch"
abbr gc "git commit"
abbr gp "git push"
abbr cl "clear"
abbr .. "cd .."
abbr ta "tmux attach"
abbr vi "vim"
abbr phpserver "php -S localhost:8000"

function !!
    eval $history[1]
end

function histsearch
    history search --contains --limit=1 $argv
end

function space
    df -Ph . | tail -1 | awk '{print $4}'
end

function tardir
    set dirname (string trim -r / $argv[1])
    tar -czf "$dirname.tar.gz" $argv[1]
end

function mkcd
    mkdir $argv[1]; and cd $argv[1]
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
