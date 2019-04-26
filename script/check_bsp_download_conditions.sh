#! /bin/bash

source ./bash_utils/messages.sh
source ./bash_utils/checking.sh


function help( ) {
    echo "Usage: $0 <min free speace> <server> <bsp folder>"
    echo "min free space : minimum free space required for the download (ex: 100MB)"
    echo "server         : URL of the remote server"
    echo "bsp folder     : folder in which the BSP will be downloaded"
    echo
}


if [[ $# -lt 3 ]]; then
    echo_e "ERROR: too few arguments"
    help
    exit 1
fi

MIN_FREE_SPACE=$1
SERVER=$2
ROOT_FOLDER=$3


# ---------------------------------------------------------
#                    Checking steps
# ---------------------------------------------------------

# - check if there is enough space (${MIN_FREE_SPACE})
echo_i_n "Check free space (${MIN_FREE_SPACE})... "
check_free_space $MIN_FREE_SPACE
ret=$?
if [[ $ret -eq 1 ]]; then
    process_ok
else
    process_ko
    echo_e "checking procedure fault!!!"
    exit 1
fi

# - check connection
echo_i_n "Check connection... "
check_connection_server $SERVER
ret=$?
if [[ $ret -eq 0 ]]; then
    process_ok
else
    process_ko
    echo_e "checking procedure fault!!!"
    exit 1
fi

# - check if the target folder already exists
echo_i_n "Check if the BSP already exists... "
check_file_exist $ROOT_FOLDER
ret=$?
if [[ $ret -eq 0 ]]; then
    process_ok
else
    process_ko
    echo_e "checking procedure fault!!!"
    exit 1
fi

exit 0