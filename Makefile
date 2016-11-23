base_image=lins05/base:14.04
base_image_1604=lins05/base:16.04

all:
	@echo
	@echo Pleaes use '"make base"' or "make base-1604".
	@echo

base:
	cd $(CURDIR) &&	docker build -t $(base_image) base

base-1604:
	cd $(CURDIR) &&	docker build -t $(base_image_1604) base-1604

push:
	docker push $(base_image)

push-1604:
	docker push $(base_image_1604)

.PHONY: base base-1604 push push-1604
