source $1/lib/app/helper.sh $1
MINOR_DIRECTORY=$ROOT/lib/macinstalls

echo_separator_bar
echo "Welcome to the Macintosh Installer"

choose_from_selection $(ls $MINOR_DIRECTORY)
if [[ "$RETURN" == "FAILURE" ]]; then exit; fi
selection=$RETURN
run_script $selection
