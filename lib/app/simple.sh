source $1/lib/app/helper.sh $1 $2
MINOR_DIRECTORY=$ROOT/lib/simple

echo_separator_bar
echo "Welcome to the Linux simple installer app"
echo "Most of the installers here are one liners, but you wouldn't know they exist unless we had documented them here!"

choose_from_selection $(ls $MINOR_DIRECTORY)
if [[ "$RETURN" == "FAILURE" ]]; then exit; fi
selection=$RETURN
run_script $selection
