
NAME = my-vast
IMAGE = alexkuk/my-vast

image:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

run:
	docker run -d --rm -p 8888:8888 -p 6006:6006 --name $(NAME) $(IMAGE)

stop:
	docker rm -f $(NAME)

attach:
	docker exec -it $(NAME) /bin/bash
