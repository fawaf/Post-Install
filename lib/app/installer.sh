source $1/lib/app/helper.sh $1
MINOR_DIRECTORY=$ROOT/lib/installs

echo_separator_bar
echo "Welcome to the Linux installer app"

choose_from_selection $(ls $MINOR_DIRECTORY | grep \.sh$)
if [[ "$RETURN" == "FAILURE" ]]; then exit; fi
selection=$RETURN
run_script $selection
