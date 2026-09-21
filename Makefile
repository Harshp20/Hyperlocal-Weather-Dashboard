# just run `make run-dev` at this project's root after placing your API keys in `compose.development.yaml`. Refer compose.example.yaml.
run-dev:
	docker compose -f compose.development.yaml up

build-dev:
	docker build \
	--platform=linux/arm64,linux/amd64 \
	-f Dockerfile.development \
	-t harshp20/hyperlocal-weather-dashboard:dev .

push-dev: build-dev
	docker push harshp20/hyperlocal-weather-dashboard:dev