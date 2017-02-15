#
#	File: .bash_profile
#
#	Author: Cameron Bergoon 
#
#   	Date Created: 12-27-13

#
#	Navigation - Several navigation shortcuts.
#

#Prompt Default: \h:\W \u\$

cd() { builtin cd "$@"; ls -G; }      			# cd:    Always list directory contents upon 'cd'
alias f='open -a Finder ./'                 		# f:     Opens current directory in MacOS 
alias lf='ls -Gl | grep ^d' 				# lf:    Only list directories
alias lsd='ls -Gal | grep ^d' 				# lsd:   Only list directories, including hidden ones
alias ls='ls -G'					# ls:    With color
alias which='type -all'                     		# which: Find executables
alias show_options='shopt'                  		# ccat:  Cat file with syntax highlighting 
alias ccat='pygmentize -O bg=dark'
alias rg++='g++-mp-4.9'					#rg++:   Calls real GCC install
alias mpic++='mpicxx-openmpi-mp'			#mpic++: Calls mpi compiler
alias mpiexec='mpiexec-openmpi-mp'			#mpiexec:Calls mpi execute
alias godebug='/Users/cbergoon/Go/bin/godebug'
alias listeners='sudo lsof -i | grep LISTEN'		#listeners: See what processes are listening on what ports

#
#	Hidden Files Alias - Show/Hide hidden files in Finder. (Mac only)
#

alias hidehidden='defaults write com.apple.finder AppleShowAllFiles False; killall Finder'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles True; killall Finder'

#
#	Trash - Moves a file to the Trash folder in Finder 
#

trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

#
#	Quick Look - Opens a file as read only in Preview
#

ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
function mcd() {
  mkdir -p "$1" && cd "$1";
}

#
#	Sublime - Open a file with sublime.
#

function st() {
        open -a Sublime\ Text "$@"
}

#
#	Extract - Extracts various file types.
#

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#
#	Git aliases - Including two gitlog commands with special formatting
#

alias gitlog='git log --graph --all --format=format:'\''%C(bold red)%h%C(reset) - %C(bold blue)%aD%C(reset) %C(bold blue)(%ar)%C(reset)%C(bold green)%d%C(reset)%n'\'''\''          %C(black)%s%C(reset) %C(bold black)— %an%C(reset)'\'' --abbrev-commit'

alias glf='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%an:%s"'

alias gs='git status '
alias gl='git log'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gpl='git pull'
alias gpu='git push'
alias gt='git stash'
alias got='git '
alias get='git '

#
#	Networking aliases - Simple Python Server as well as IP addr. shortcut.
#

alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

#
# 	Notes - This is just a simple function to take notes.  
#

note () {

    # if file doesn't exist, create it
    if [[ ! -f $HOME/documents/notes ]]; then
        touch $HOME/documents/notes
    fi

    if [[ $# -eq 0 ]]; then
        # no arguments, print file
        cat $HOME/documents/notes
    elif [[ "$1" == "-c" ]]; then
        # clear file
        echo "" > $HOME/documents/notes
    elif [[ "$1" == "-e" ]]; then
        nano $HOME/documents/notes
    elif [[ "$1" == "-u" ]]; then
        shift
        echo "!!!" $(date) "- $@" >> $HOME/documents/notes
    else
        # add all arguments to file
        echo $(date) "- $@" >> $HOME/documents/notes
    fi
}

#
#	apptoipa - Converts a .app format file to .ipa for IOS builds
#

apptoipa(){
	if [ -d "Payload" ]; then
  		rm -fr Payload/*
	else
  		mkdir Payload
	fi
	# if you'd rather copy the .app file, then replace the next line with:
	cp -r $1 Payload
	#mv $1 Payload
	zip -r $2.ipa Payload
	rm -fr Payload 
}

#
#	targzip - Produces a *.tar.gz file from folder.
#

targzip(){
	tar cvf $1.tar $1
	gzip $1.tar
}

#
#	targunzip - Unarchives and unzips a *.tar.gz file.
#

targunzip(){
	tar -zxvf $1
}

#
# Export Editor Path
#

export EDITOR=/usr/bin/nano


#
# Export JAVA_HOME
#

export JAVA_HOME=$(/usr/libexec/java_home)

#
# Export Maven
#

export PATH=/usr/local/apache-maven-3.3.3/bin:$PATH

##
# Your previous /Users/cbergoon/.bash_profile file was backed up as /Users/cbergoon/.bash_profile.macports-saved_2014-02-23_at_17:14:55
##

# MacPorts Installer addition on 2014-02-23_at_17:14:55: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#Go Path Export
export GOPATH="/Users/cbergoon/Go/"

#Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local:$PATH"


# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/cbergoon/.sdkman"
[[ -s "/Users/cbergoon/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/cbergoon/.sdkman/bin/sdkman-init.sh"

# ANTLR  
export CLASSPATH=".:/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH"
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# added by Anaconda3 4.0.0 installer
export PATH="//anaconda/bin:$PATH"

export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

export GOPATH=/Users/cbergoon/Dropbox/Go
export PATH=$PATH:/Users/cbergoon/Dropbox/Go/bin
