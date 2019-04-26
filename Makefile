

CMD=docker run -it --rm -v $(shell pwd):$(shell pwd) -v /dev:/dev -v /proc:/proc -v /sys:/sys -w $(shell pwd) -e USER_NAME=$(shell whoami)
DOCKER_IMG=alienmind85/yocto-builder:L4.14.78 bash


interactive:
	$(CMD) $(DOCKER_IMG)


info:
	$(CMD) -e USER_CMD=./script/presentation.sh $(DOCKER_IMG)


bsp_pull_imx_4.14.78:
	$(CMD) -e USER_CMD=./script/imx_bsp_pull_4_14_78.sh $(DOCKER_IMG)



bsp_open_imx_4.14.78:
	$(CMD) -e USER_CMD=./script/imx_bsp_open_4_14_78.sh -e PERSIST=1 $(DOCKER_IMG)


