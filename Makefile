base_image=lins05/base:14.04
base_image_1604=lins05/base:16.04

java8_squashed_image=lins05/java:8-squashed
java8_image=lins05/java:8

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

java8:
	cd $(CURDIR) &&	docker build -t $(java8_image) java8

squash-java8:
	TMP_DIR=/tmp/docker-squash/tmp docker-squash --tag $(java8_squashed_image) $(java8_image) --from-layer ubuntu:14.04
	docker tag $(java8_squashed_image) $(java8_image)
	docker history $(java8_image)

push-java8:
	docker history $(java8_image)
	docker push $(java8_image)

.PHONY: base base-1604 push push-1604 java8 squash-java8 push-java8
