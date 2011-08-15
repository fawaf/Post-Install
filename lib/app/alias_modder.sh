# alias_modder.sh
# Kevin's crap
source $1/lib/app/helper.sh $1

echo_separator_bar
echo "Modify your aliases here!"
echo_separator_bar

touch ~/.post-aliases
while true; do
  echo "q = Quit"
  echo "1 = Fix dot navigation"
  read -p "Choose command: " REPLY
  if [ "$REPLY" = q ]; then
    echo "Quitting..."
    break
  elif [ "$REPLY" = 1 ]; then
    FOUND=`egrep "alias \.\.=" ~/.post-aliases`
    if [ ${FOUND} ]; then
      echo "Found something already"
      echo $FOUND
      sed -ie "s/alias ..(.)$/alias ..='cd ..'/" ~/.post-aliases
    else
      echo "Not found"
      echo -e "alias ..=\"cd ..\"" | tee -a ~/.post-aliases
    fi
  else
    echo "Invalid choice"
  fi
done
