#!/bin/bash

echo "welcome to gitCrypter file by"
echo "Make your choice"
MENU="Encrypt Decrypt"
select CH in $MENU; do
	if [ $REPLY = 1 ];
	then
		echo
		echo "You have selected: $REPLY | $CH"
		echo
		echo "Enter path to the file[if file is in same directory just hit enter] eg.[/home/username/folder/..]"
		read LOCATION
		echo
		ls $LOCATION --hide=*.gpg
		error=$?
		if [ $error == 0 ];
		then
			echo
			echo "please enter the file name"
			read FILE_NAME
			if [ -a $LOCATION/$FILE_NAME ];
			then
				gpg -c $LOCATION/$FILE_NAME
				error=$?
				if [ $error == 0 ];
				then
					rm -f $LOCATION/$FILE_NAME
					echo 
					echo "====The file has been encrypted===="
                    echo "==== gitCrypter BY GITSALAH===="
					echo
				else
					echo
					echo "***Error occured! File not encrypted***"
					echo
				fi
			else
				echo
				echo "***File not found***"
				echo
			fi
		else
			echo
			echo "***Path not valid***"
			echo
		fi
		break
	elif [ $REPLY = 2 ];
	then
		echo 
		echo "You have selected: $REPLY | $CH"
		echo 		
		echo "Enter path to the file[if file is in same directory just hit enter] eg.[/home/username/folder/..]"
		read LOCATION
		echo 
		ls $LOCATION
		error=$?
		if [ $error == 0 ];
		then
			echo
			echo "please enter the file name with .gpg"
			read FILE_NAME
			if [ -a $LOCATION/$FILE_NAME ];
			then
				gpg -d $LOCATION/$FILE_NAME > $LOCATION/${FILE_NAME::-4}
				error=$?
				if [ $error == 0 ];
				then
					rm -f $LOCATION/$FILE_NAME
					echo 
					echo "====The file has been decrypted===="
                    echo "==== gitCrypter BY GITSALAH===="

					echo
				else
					echo 
					echo "***Error occured! File not decrypted***"
				fi
			else
				echo
				echo "***File not found***"
				echo 
			fi
		else
			echo
			echo "***Path not valid***"
			echo 
		fi
		break
	fi
done