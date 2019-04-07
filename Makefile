



interactive:
	docker run -it --rm -v $(shell pwd):$(shell pwd) -v /dev:/dev -v /proc:/proc -v /sys:/sys -w $(shell pwd) -e USER_NAME=$(shell whoami)  alienmind85/yocto-builder:L4.14.78 bash
