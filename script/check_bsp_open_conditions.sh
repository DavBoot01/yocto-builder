#! /bin/bash

source ./bash_utils/messages.sh
source ./bash_utils/checking.sh


function help( ) {
    echo "Usage: $0 <yocto bsp folder> [file to check the existence]"
    echo "yocto bsp folder            : BSP Yocto root folder"
    echo "file to check the existence : list of file to check in order to validate the BSP folder"
    echo
}


if [[ $# -lt 1 ]]; then
    echo_e "ERROR: to few arguments"
    help
    exit 1
fi

ROOT_FOLDER=$1
shift
file_array=("$@")



# ---------------------------------------------------------
#                    Checking steps
# ---------------------------------------------------------

# - check if the root folder exists
echo_i_n "Check if the BSP exists... "
check_file_exist $ROOT_FOLDER
ret=$?
if [[ $ret -eq 1 ]]; then
    process_ok
else
    process_ko
    echo_e "checking procedure fault!!!"
    exit 1
fi


# - check if the root folder exists
echo_i "Check if BSP's main file exist (${#file_array[@]})... "
for f in "${file_array[@]}"; do
    echo_i_n "file  '${f}'... "
    check_file_exist ${ROOT_FOLDER}/$f
    ret=$?
    if [[ $ret -eq 1 ]]; then
        process_ok
    else
        process_ko
        echo_e "checking procedure fault!!!"
        exit 1
    fi
done

