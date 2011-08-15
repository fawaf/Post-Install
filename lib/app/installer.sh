source $1/lib/app/helper.sh $1

echo_separator_bar
echo "Welcome to the Linux installer app"

choose_from_selection $(ls $root/lib/installs)
if [[ "$RETURN" == "FAILURE" ]]; then exit; fi
selection=$RETURN
source $root/lib/installs/$selection $root
