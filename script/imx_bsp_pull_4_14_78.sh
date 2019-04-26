#! /bin/bash

source ./bash_utils/messages.sh

MIN_FREE_SPACE=400MB
SERVER=https://source.codeaurora.org/external/imx/imx-manifest
ROOT_FOLDER=imx-yocto-bsp-4._14.78

CMD_CHECK=./script/check_bsp_download_conditions.sh
CMD_PULL=./script/imx_bsp_pull.sh



# Checking of BSP download conditions
echo "----------------------------------------------------------"
echo              "Checking of BSP download conditions"
echo "----------------------------------------------------------"
if [[ -e $CMD_CHECK ]]; then

    $CMD_CHECK ${MIN_FREE_SPACE} ${SERVER} ${ROOT_FOLDER}
    if [[ $? -eq 0 ]]; then
        echo "-----------------------"
        echo_ok "Checking procedure passed"
        echo "-----------------------"
    else
        echo "-----------------------"
        echo_e "TASK ABORTED!!!"
        echo "-----------------------"
        exit 1
    fi

else

    echo_e "command \'${CMD_PULL}\' not found"
    echo "-----------------------"
    echo_e "TASK ABORTED!!!"
    echo "-----------------------"
    exit 1
fi

sleep 2


# Pull NXP BSP @ version 4.14.78
echo "----------------------------------------------------------"
echo              "Pull NXP BSP @ version 4.14.78"
echo "----------------------------------------------------------"
if [[ -e $CMD_PULL ]]; then

    $CMD_PULL ${ROOT_FOLDER} ${SERVER} imx-linux-sumo imx-4.14.78-1.0.0_ga.xml
    if [[ $? -eq 0 ]]; then
        echo "-----------------------"
        echo_ok "Yocto bsp pull operation Successful!!!"
        echo "-----------------------"
    else
        echo "-----------------------"
        echo_e "TASK ABORTED!!!"
        echo "-----------------------"
        exit 1
    fi

else

    echo_e "command \'${CMD_PULL}\' not found"
    echo "-----------------------"
    echo_e "TASK ABORTED!!!"
    echo "-----------------------"
    exit 1
fi