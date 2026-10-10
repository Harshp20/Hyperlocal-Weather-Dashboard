build-dev:
	@echo 'Building Development image...'
	docker build \
	--platform=linux/arm64,linux/amd64 \
	-f Dockerfile.development \
	-t harshp20/hyperlocal-weather-dashboard:dev .

push-dev: build-dev
	@echo 'Pushing image to docker hub registry...'
	docker push harshp20/hyperlocal-weather-dashboard:dev

# just run `make run-dev` at this project's root after placing your API keys in `compose.development.yaml`. Refer compose.example.yaml.
run-dev:
	@echo 'Running Development build...'
	docker compose -f compose.development.yaml up

all-dev:
	@echo "Running all dev steps..."
	@make push-dev && make run-dev