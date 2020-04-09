#!/bin/bash

LANGS=("Português" "English")
CODES=("pt_PT" "en")

PS3="Which language do you wish to use? "
select lang in "${LANGS[@]}";
do
	if [[ -n $lang ]]; then
		for i in ${!LANGS[@]}
		do
			if [ "${LANGS[i]}" = "$lang" ]; then
				/usr/bin/aspell --dont-backup --mode=email --lang="${CODES[i]}" check ${1}
				break
			fi
		done
	else
		echo "Invalid selection."
	fi
	break
done
