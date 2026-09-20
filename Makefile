# just run `make run-dev` at this project's root after placing your API keys in `compose.development.yaml`. Refer compose.example.yaml.
run-dev:
	docker compose -f compose.development.yaml up

# accessible on http://localhost:80
run-prod:
	docker run -p 4000:80 harshp20/hyperlocal-weather-dashboard:prod

build-dev:
	docker build \
	--platform=linux/arm64,linux/amd64 \
	-f Dockerfile.development \
	-t harshp20/hyperlocal-weather-dashboard:dev .

build-prod:
	docker build \
	--build-arg VITE_OPENWEATHER_API_KEY=YOUR_OPEN_WEATHER_3.0_API_KEY \
	--build-arg	VITE_MAPTILER_API_KEY=YOUR_MAPTILER_API_KEY \
	--platform=linux/arm64,linux/amd64 \
	-f Dockerfile.production \
	-t harshp20/hyperlocal-weather-dashboard:prod .

push-prod: build-prod
	docker push harshp20/hyperlocal-weather-dashboard:prod

push-dev: build-dev
	docker push harshp20/hyperlocal-weather-dashboard:dev