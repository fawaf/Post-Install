brew install autojump
echo "if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
  fi
fi" >> ~/.bash_profile
