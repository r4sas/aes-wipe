#!/bin/bash

$device = $1

echo '***********************************************'
echo '/                   aes-wipe                  /'
echo '***********************************************'
echo 'This script will wipe the entire HDD you selected.'
echo 'USE AT YOUR OWN RISK!'
echo ''
echo 'Do you want to proceed? (y/n):'
read eingabe
if  [ "$eingabe" == "y" ]
	then
		echo 'Wiping in progress...'
		
		echo 'Pass 1 - Writing zeros'
		dd if=/dev/zero of=$device bs=4M 2> /dev/null
		
		echo 'Pass 2 - Writing ones'
		dd if=/dev/zero count=100 bs=1 | tr "\000" "\377" > $device 2> /dev/null
		
		echo 'Pass 3 - Writing random data'
		openssl enc -aes-256-ctr -pass pass:"$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64)" -nosalt < /dev/zero > $device 2> /dev/null
		
		echo 'Pass 4 - Writing random data'
		openssl enc -aes-256-ctr -pass pass:"$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64)" -nosalt < /dev/zero > $device 2> /dev/null
		
		echo 'Pass 5 - Writing random data'
		openssl enc -aes-256-ctr -pass pass:"$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64)" -nosalt < /dev/zero > $device 2> /dev/null
		
		
		echo 'Finished at: '
		date
	
else
	echo 'Process aborted.'
fi
exit
