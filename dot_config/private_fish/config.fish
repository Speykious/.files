eval (ssh-agent -c) > /dev/null 2>&1
ssh-add ~/.ssh/git_rsa ~/.ssh/frogs_rsa > /dev/null 2>&1

function let
  $argv &>/dev/null </dev/null &; disown
end

function hisc
  set n 1
  test -e "$1"; and set n "$1"
  history | sed -n "$1p"
end

alias c clear
alias cla 'clear; and la'
alias duh 'du -hs'
alias DUH 'du -h'
alias kast 'tmux kill-ses -a && tmux kill-ses'
alias tear 'clear && tmux clear-history'
alias tla 'tear && la'
alias yeet 'yay -R'
alias yup 'yay -Syu --noconfirm'
alias E 'sudo -e'
status is-interactive && alias rm 'rm -I'

set SPACEFISH_GIT_SYMBOL ' '


# git aliases
alias g git
alias ga 'git add'
alias gd 'git diff'
alias gs 'git status'
alias gc 'git commit'
alias gcm 'git commit -m'
alias gcam 'git commit -am'
alias gp 'git push'
alias gpl 'git pull'
alias gl 'git log'

# opam configuration
source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# starship startup ─ comment if not wanted
starship init fish | source

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/speykious/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/speykious/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish
scheme set dracula

thefuck --alias | source

freshfetch
