source ~/.bashrc
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

trash()
{
	mv $@ ~/trash  #注意，这里可以自行定义。长时间删除文件后，记得清空此文件夹。
}

export LC_ALL="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
export TERM="linux"
alias tt='tmux -2 attach-session -t 0'
alias tl='tmux -2 list-session'
alias tmux='tmux -2'
alias rm='trash '
alias trm='/usr/bin/rm '
alias cds='cd ~/code'
export EDITOR="vim"
ulimit -c unlimited


echo "Initialize bash_profile"
echo bash_profile Initialization!
