#!/usr/bin/env bash -e
##  @copyright 2018 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## File: generate_quiz.sh
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## --
## Created : <2018-08-19>
## Updated: Time-stamp: <2019-01-01 18:18:07>
##-------------------------------------------------------------------
function generate_quiz() {
    local folder=${1?}
    cd "$folder"
    target_xml="quiz.xml"
    if ls *.xml 1>/dev/null 2>&1; then
        echo "In $folder, generate $target_xml"
        cat [0-9]*.xml > "$target_xml"
        echo '''			</questions>
		</quiz>
	</data>
</wpProQuiz>
<!--
Performance optimized by W3 Total Cache. Learn more: https://www.w3-edge.com/products/


Served from: www.dennyzhang.com @ 2018-08-20 00:39:13 by W3 Total Cache
-->
''' >> "$target_xml"
    fi
    cd -
}

problem=${1:-""}
if [ -n "$problem" ]; then
    generate_quiz "*/$problem"
else
    for d in *; do
        if [ -d "$d" ]; then
            generate_quiz "$d"
        fi
    done
fi
