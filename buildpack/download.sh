#!/bin/bash

lang_dev=${1:-all}

language=(java php nodejs go static python common)

if [ "$lang_dev" == "all" ];then
    for lang in ${language[@]}
    do
        if [ -f "/language/${lang}" ];then
            echo "Installing ${lang} requirements"
            /language/${lang}
        fi
    done
elif [ "$1" == "bash" ];then
    exec /bin/bash
elif [ "$1" == "dev" ];then
    lang_dev_build=$2
    for lang in $(echo $lang_dev_build | tr ',' ' ' )
    do
        echo ${language[@]} | grep "$lang" > /dev/null
        [ "$?" -eq 0  ] && (
            if [ -f "/language/${lang}" ];then
            echo "Installing ${lang} requirements"
            /language/${lang}
            fi
        )
    done
else
    if [ -f "/language/${lang_dev}" ];then
        echo "Installing ${lang_dev} requirements."
        /language/${lang_dev}
    else
        echo "Not Found ${lang_dev}."
    fi
fi