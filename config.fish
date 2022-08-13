alias ..='cd ..'
alias ...='cd ../..'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias la='ls -a'
alias vi='vim'
alias f="open ."
alias tree='tree -C'
alias rm='rmtrash'
alias lsenv='ls ~/.local/share/virtualenvs'/
alias pev='pipenv'
alias pevpy='pipenv run python'
alias tm='tmux'
alias dk='docker'

alias proverif='~/.opam/default/bin/proverif'

# bobthefish
set fish_greeting
set -g theme_display_git_dirty no
set -g theme_display_git_untracked yes
set -g theme_display_git_master_branch no

set -g theme_display_date no
set -g theme_color_scheme solarlized-dark

# gcloud
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# dtvcl
function sshnl
    ssh -NL localhost:23750:/var/run/docker.sock $argv
end
