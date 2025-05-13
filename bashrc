# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias gv='git pull'
alias g^='git push'
alias gco='git checkout'
alias gca='git commit --amend'
alias ga='git add'
alias gc='git commit'
alias grc="git rebase --continue"
alias gst="git status"
alias gat="ga . ':!tags'"
alias tf="EXTRA_ENVFILES=".env-test" withenv venv/bin/py.test"
alias epbrun="withenv vendor/bundle/bundle exec deploy-hooks/init.uwsgi"
alias ez="cd ~/code/easypost"
alias ep="cd ~/code/easypost/easy_post"
alias co="cd ~/code/easypost/carrierops"
alias royal="cd ~/code/easypost/royalmail"
alias remix="make cleandb venv/devdb_created venv/testdb_created venv/testdb venv/devdb"
alias lso="cd ~/code/easypost/lso"
alias clean_vagrant="pkill -u vagrant"
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias c='cd'
alias l='ls -CF'
alias la='ls -aF'
alias ll='ls -lhF'
alias lla='ls -lahF'
alias llt='ls -lhtF'
alias llat='ls -lahtF'
alias pu='pushd'
alias po='popd'
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color=always'
alias lessr='less -R'
alias morer='more -R'
alias retmux='tmux source-file ~/.tmux.conf'
alias nbash="nvim ~/.bashrc"
alias sbash="source ~/.bashrc"
alias ez="cd ~/code/easypost"
alias cars="cd ~/code/easypost/cif_carriers/python_carrier_integrations/carriers"
alias pycar="cd ~/code/easypost/python_carrier_integrations/"
alias pycar2="cd ~/code/easypost/python_carrier_integrations2/"

# NVIM helper tools
alias nead='nvim `git diff HEAD^ --name-only` -c ":tab all"' # tabs all files that are on top of head
nvim_ag () {
  nvim `ag $1 | cut -d : -f 1 | sort | uniq` -c ':tab all'
}
alias nag="nvim_ag"

nag_multi () {
  nvim `fzf --multi $1 | cut -d : -f 1 | sort | uniq` -c ':tab all'
}


# DEBUGGER TOOLS: Requires htk install with pip install htk
alias fdebug="tail -f /tmp/fdebug.log"

alias kill-port=do_kill_port
do_kill_port() {
    pids_array=($(lsof -t -i:$1 | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g'))
    if [ "$pids_array" ] ; then
        for pid in "${pids_array[@]}"; do
            echo "Killing process $pid..."
            kill "$pid"
        done
    else
        echo "No process running on port $1"
    fi
}
