#!/usr/bin/env zsh

while IFS= read -r line; do
	phrase=$(echo $line | grep -o '[^	]*' | head -n 1)
	phonetic=$(echo $line | grep -o '[^	]*' | head -n 2 | tail -n 1)
	meaning=$(echo $line | grep -o '[^	]*' | tail -n 1)
	if [[ $phonetic == $meaning ]]; then
		#echo "{\n	phrase: $phrase\n	meaning: $meaning\n}"
		echo "---\nphonetic:\n - $phrase\ncategories:\n - \"[[]]\"\n---\n<span style=\"font-size: 6em;\">$phrase</span>\n$meaning" > $phrase.md
	else
		#echo "{\n	phrase: $phrase\n	phonetic: $phonetic\n	meaning: $meaning\n}"
		echo "---\nphonetic:\n - $phonetic\ncategories:\n - \"[[]]\"\n---\n<span style=\"font-size: 6em;\">{$phrase|$phonetic}</span>\n$meaning" > $phrase.md
	fi
done < "日本語言葉 - Sheet1.tsv"

