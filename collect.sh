#!/bin/bash

DATE="$(date +%y%m%d)"

mkdir -pv data/

if [ ! -e "data/git-time.${DATE}.txt.gz" ]; then
	find ~/ -type d -name '.git' \
		| while read DIR; do
			echo 1>&2 "Scaning: ${DIR}"
			(cd ${DIR}; git log --pretty="%cI %ae") \
				| awk '$2~"yanlinlin82@|yan\\.linlin@"'
		done \
			| gzip -9 \
			> data/git-time.${DATE}.txt.gz
fi
