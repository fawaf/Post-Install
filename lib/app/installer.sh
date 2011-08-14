root=$1
source $root/lib/app/helper.sh
echo ""
echo "Welcome to the Linux installer app"

choose_from_selection $(ls $root/lib/installs)
local selection=$RETURN
bash $root/lib/installs/$selection $root
