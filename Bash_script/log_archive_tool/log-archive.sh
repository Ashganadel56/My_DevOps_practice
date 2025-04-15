#!/bin/bash

#**************variables and argument section**************

logdir=$1  
archive_dir=$logdir/archive
current_day=$(date +%Y%m%d)
current_time=$(date +%H%M%S)
archive_file="log_archive_$current_day_$current_time.tar.gz"

#**************run commands section**************

# ask user if he wants to delete or maintain the file after archiving
read -p "For archive and delete enter 1,For archive only enter 2: " case_num

# cheek the user need and make it
case $case_num in
1)
tar -czvf $archive_file $logdir
sudo rm -r $logdir
echo "Archiving and Deleting had been done successfully"
;;
2)
tar -czvf $archive_file $logdir
echo "Archiving had been done successfully"
;;
*)
echo "Invalid input"
;;
esac

# send the archived file to a remote server or cloud storage

read -p "For sending the archived folder to a remote server enter 1, to cloud storage enter 2" send_to

case $send_to in
1)
read -p "enter the user name: " user_name
read -p "enter the server IP: " server_IP
read -p "enter the path of the destination directory: " des_dir 
scp $user_name@$server_IP:$des_dir 
;;
2)

;;
*)

;;
esac







