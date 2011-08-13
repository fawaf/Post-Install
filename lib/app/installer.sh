source $1/lib/app/helper.sh $1

echo ""
echo "Welcome to the Linux installer app"

choose_from_selection $(ls $root/lib/installs)
selection=$RETURN
source $root/lib/installs/$selection $root
