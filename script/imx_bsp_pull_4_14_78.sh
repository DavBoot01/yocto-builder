#! /bin/bash

# Pull NXP BSP @ version 4.14.78

CMD=./imx_bsp_pull.sh

if [[ -e $CMD ]]; then

    $CMD imx-yocto-bsp-4._14.78 https://source.codeaurora.org/external/imx/imx-manifest imx-linux-sumo imx-4.14.78-1.0.0_ga.xml
    if [[ $? -eq 0 ]]; then
        echo "-----------------------"
        echo "TASK COMPLETED!!!"
        echo "-----------------------"
    else
        echo "-----------------------"
        echo "TASK ABORTED!!!"
        echo "-----------------------"
    fi

else

    echo "command \'${CMD}\' not found"
    echo "-----------------------"
    echo "TASK ABORTED!!!"
    echo "-----------------------"

fi