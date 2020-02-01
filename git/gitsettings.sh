#!/bin/sh

git config --global user.name "JinKanai"
git config --global user.email "jin@kanaisan.com"
git config --global core.editor 'vi -c "set fenc=utf-8"'
git config --global push.default simple

git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto

git config --global core.filemode false
git config --global core.autocrlf input

