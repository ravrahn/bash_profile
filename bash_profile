PATH=$PATH:~/adt-bundle-mac/sdk/platform-tools/
export PATH

scp-cse () {
    scp $1 obca109@wagner.cse.unsw.edu.au:
}

alias ls="ls -G"

cdcomp () {
	cd $HOME/Documents/13s2/COMP$1/$(ls -F $HOME/Documents/13s2/COMP$1/ | egrep "lab[0-9]{2}/$" | sort | tail -1)
}

mklab () {
	LAST_LAB=$(ls -F $HOME/Documents/13s2/COMP$1/ | egrep "lab[0-9]{2}/$" | sort | tail -1 | sed -E 's/.*([0-9]+).*/\1/')
	NEW_LAB=$(expr $LAST_LAB + 1)
	if [[ $NEW_LAB -lt 10 ]]; then
		NEW_LAB="0$NEW_LAB"
	fi
	mkdir $HOME/Documents/13s2/COMP$1/lab$NEW_LAB
	echo "Created $HOME/Documents/13s2/COMP$1/lab$NEW_LAB"
}

toggleHidden () {
	SHOWS_HIDDEN=$(defaults read com.apple.finder AppleShowAllFiles);

	SET_TO="NO"

	if [ $(echo $SHOWS_HIDDEN | egrep "(YES|TRUE)" | wc -l) -eq 0 ]; then
		SET_TO="YES"
	fi

	defaults write com.apple.finder AppleShowAllFiles $SET_TO
	killall -HUP Finder
	echo $(defaults read com.apple.finder AppleShowAllFiles);
}

crowdsay () {
	for (( i=0; i<$2; i++ )); do
		say "$1" & 2>&1 >/dev/null
	done
}

CSE="obca109@wagner.cse.unsw.edu.au"
export CSE