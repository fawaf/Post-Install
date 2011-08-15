source $1/lib/app/helper.sh $1

echo_separator_bar
echo "Welcome to the Linux Tooler"

choose_from_selection $(ls $root/lib/tools)
if [[ "$RETURN" == "FAILURE" ]]; then exit; fi
selection=$RETURN
source $root/lib/tools/$selection
