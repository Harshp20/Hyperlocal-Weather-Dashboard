# just run `make run-dev` at this project's root after placing your API keys in `compose.development.yaml`. Refer compose.example.yaml.
run-dev:
	docker compose -f compose.development.yaml up

# accessible on http://localhost:80
run-prod:
	docker compose -f compose.production.yaml up