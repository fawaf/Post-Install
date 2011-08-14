source $1/lib/app/helper.sh $1

echo ""
echo "Welcome to the Linux Tooler"

choose_from_selection $(ls $root/lib/tools)
selection=$RETURN
source $root/lib/tools/$selection
