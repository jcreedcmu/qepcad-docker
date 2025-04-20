build:
	docker build . -t qepcad

debug:
	docker run  --rm -it --entrypoint=/bin/bash qepcad:latest
