export EDITOR=vim
set -o vi

# $PATH fuckery
export PATH=/usr/local/bin:$PATH
eval "$(rbenv init -)"

export HISTFILESIZE=100000
export HISTSIZE=100000 
#export HISTIGNORE="zsh*:ls*:rm*:cd*:CD*:ps*:exit*:reset*:clear*:synaptic*:mkdir*:cat*"
export HISTIGNORE="zsh*"
export HISTCONTROL=ignoreboth
shopt -s histappend
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

alias l="ls -lhA"
alias ll="ls -lhA"
#alias cleanDSStore="find . -name '.DS_Store' -type f -delete"
alias tre="tree -a"

function onetab {

	if [ $# -gt 0 ]
	then
		if [ "$1" = "show" ]
		then
			open -W -n -a MacDown /Users/flegelleicht/.safari-sessions.markdown
		else
			/Users/flegelleicht/projekte/code/automation/macos-automation/collect-safari-urls.js
			open -W -n -a MacDown /Users/flegelleicht/.safari-sessions.markdown
		fi
	else
		/Users/flegelleicht/projekte/code/automation/macos-automation/collect-safari-urls.js
	fi
}
		
function cleanDSStore {
	find . -name '.DS_Store' -type f -delete
}

function serve {
  port="${1:-55555}"
	ruby -run -e httpd . -p $port -b 0.0.0.0
}

function tabname {
  printf "\e]1;$1\a"
}

function ftoc {
	if [ $# -eq 0 ]
		then
			echo "Please give at least one argument"
			return -1
	fi
	res=$(echo "scale=1;(5/9) * ($1-32)" | bc)
	echo $res
}

function ctof {
	if [ $# -eq 0 ]
		then
			echo "Please give at least one argument"
			return -1
	fi
	res=$(echo "scale=1;((9/5) * $1)+32" | bc)
	echo $res
}

function gitify-prompt {
  if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  	__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  	source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
  fi
}

function gs2pdf {
	gs -q -sDEVICE=pdfwrite -r300 -dBATCH -dPDFFitPage -dNOPAUSE -sOutputFile="$2" "$1"
}
# defaults write com.sublimetext.2 ApplePressAndHoldEnabled -bool false

# Zippen von Ordnern mit Ausschluss bestimmter Unterpfade
# zip Beispiele\ 2 -r * -x *build/* -x *dist/* -x *Artikelverwaltung_2/* -x *.DS_Store*

# Überwachen einer Datei auf Änderungen und dann was daraufhin tun
# fswatch -0 <DATEI | WICSA2015.tex> | xargs -0 -n 1 <COMMAND | pdflatex>
# fswatch -0 ICSE2015TwinPeaks.tex | xargs -0 -n 1 pdflatex -halt-on-error
# fswatch -0 *.tex -r chapters/ | xargs -0 -n 1 -I {} make

# rsync -rvu ~/Documents/.Trash/ /Volumes/Medien/sync/

# Teilweises Ausschecken von SVN-Repos
# svn co --depth immediates https://...
# Nachträgliches Hinzufügen von Unterordnern
# svn up --set-depth (infinity | immediates | files) <Unterordner>
# Nachträgliches Löschen von Zeug
# svn up --set-depth empty <Unterordner>

# /usr/local/sbin/minidlnad -f ~/.config/minidlna/minidlna.conf -P ~/.config/minidlna/minidlna.pid -R

# Completions
. /usr/local/etc/bash_completion.d/subversion
. /usr/local/etc/bash_completion.d/lein-completion.bash


###-begin-yo-completion-###
if type complete &>/dev/null; then
  _yo_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           yo-complete completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _yo_completion yo
fi
###-end-yo-completion-###

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
