#!/bin/bash
# Graphical Vim and Janus plugins for the best editor in the world
# https://github.com/carlhuda/janus

sudo apt-get install git curl rake ruby-dev exuberant-ctags vim-gnome
curl https://raw.github.com/carlhuda/janus/master/bootstrap.sh -o - | sh
