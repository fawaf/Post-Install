source $1/lib/app/helper.sh $1
MINOR_DIRECTORY=$ROOT/lib/tools

echo_separator_bar
echo "Welcome to the Linux Tooler"

choose_from_selection $(ls $MINOR_DIRECTORY)
if [[ "$RETURN" == "FAILURE" ]]; then exit; fi
selection=$RETURN
run_script $selection
