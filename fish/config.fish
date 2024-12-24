if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH $HOME/.nodebrew/current/bin /usr/local/Cellar/go/1.19.4/bin/go /usr/local/opt/go@1.18/bin/go $HOME/go/bin $HOME/.volta/bin $PATH

alias scope='cd $HOME/repos/scopeNext/'
alias repos='cd $HOME/repos/'
alias ...='cd ../../'

alias so='source'
alias ll='ls -la'

alias vi='/usr/local/bin/nvim'
alias vim='/usr/local/bin/nvim'

alias gs='git status'
alias ga='git add'
alias gc='git checkout'
alias gct='git commit'
alias gpl='git pull origin'
alias gph='git push origin'

alias gb='git branch'
alias gst='git stash'
alias glo='git log'
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
