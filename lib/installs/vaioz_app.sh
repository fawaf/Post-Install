#!/bin/bash
# Installs the Vaio Z Kernel Module

logfile=/dev/null

echo "Downloading Vaio Z Kernel Module..."
wget http://www.logic.at/staff/preining/software/sony-laptop-zseries-0.9np8.tar.gz -O ~/Downloads/sony-laptop-zseries-0.9np8.tar.gz &> $logfile
mkdir ~/vaio_kernel_module/ &> $logfile
echo "Extracting Vaio Z Kernel Module..."
tar -xvzf ~/Downloads/sony-laptop-zseries-0.9np8.tar.gz -C ~/vaio_kernel_module/ &> $logfile
rm ~/Downloads/sony-laptop-zseries-0.9np8.tar.gz

echo "Installing Vaio Z Kernel Module..."
pushd ~/vaio_kernel_module/sony-laptop-zseries-0.9np8/ &> $logfile
make &> $logfile
sudo make install &> $logfile
test=`sudo make test` &> $logfile

correct=`echo -e $"rmmod sony-laptop\ninsmod sony-laptop.ko debug=1"` &> $logfile
status="success"
if [ "$test" != "$correct" ];
then
  status="failed"
fi
popd &> $logfile
rm -rf ~/vaio_kernel_module/ &> $logfile

if [ "$status" = "failed" ];
then
	echo "An error has occured in the installation. The module has not been installed correctly!"
else
	echo "Finished Installing Vaio Z Kernel Module!"
fi
