# User specific aliases and functions
[[ -s "$HOME/.bashrc.ftw" ]] && source $HOME/.bashrc.ftw

alias gv='git pull'
alias g^='git push'
alias gco='git checkout'
alias gca='git commit --amend'
alias ga='git add'
alias gc='git commit'
alias grc="git rebase --continue"
alias gat="ga . ':!tags'"
alias tf="EXTRA_ENVFILES=".env-test" withenv venv/bin/py.test"
alias ez="cd ~/code/easypost"
alias ep="cd ~/code/easypost/easy_post"
alias co="cd ~/code/easypost/carrierops"
alias royal="cd ~/code/easypost/royalmail"
alias remix="make cleandb venv/devdb_created venv/testdb_created venv/testdb venv/devdb"
alias lso="cd ~/code/easypost/lso"
alias clean_vagrant="pkill -u vagrant"


# NVIM helper tools
alias nead='nvim `git diff HEAD^ --name-only` -c ":tab all"' # tabs all files that are on top of head
nvim_ag () {
  nvim `ag $1 | cut -d : -f 1 | sort | uniq` -c ':tab all'
}
alias nag="nvim_ag"


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
