#! /bin/bash

source ./bash_utils/messages.sh

# Since at the end of the script we want to go into the
# BSP Yocto folder the script must be launched as follow:
#
# . <script nams>

ROOT_FOLDER=imx-yocto-bsp-4._14.78

CMD_CHECK=./script/check_bsp_open_conditions.sh

FILE_CHECK=(setup-environment fsl-setup-release.sh sources/ 
sources/base/  sources/meta-browser/  sources/meta-freescale/
sources/meta-freescale-3rdparty/  sources/meta-freescale-distro/
sources/meta-fsl-bsp-release/  sources/meta-openembedded/
sources/meta-qt5/  sources/poky/
)

# Checking of BSP open conditions
echo "----------------------------------------------------------"
echo              "Checking of BSP open conditions"
echo "----------------------------------------------------------"
if [[ -e $CMD_CHECK ]]; then

    $CMD_CHECK ${ROOT_FOLDER} ${FILE_CHECK[@]}
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

sleep 1

echo_ok "Go into Yocto BSP folder (${ROOT_FOLDER})"
echo
echo  ${ROOT_FOLDER} > .current_folder

exit 0


