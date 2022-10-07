monitor:
	cargo watch -x check -x

completerun:
	cargo watch -x check -x test -x run

format:
	cargo fmt

start_db:
	echo "starting up the database" 
	bash scripts/init_db.sh

get_db_container:
	docker ps --filter ancestor=postgres --format "{{.Names}}"


stop_db:
	$(eval DB_CASE:=$(docker ps --filter ancestor=postgres --format "{{.Names}}"))
	echo container is $(DB_CASE)
	# echo "shutting down database"
	# docker container stop ${container}

add_migration:
	export DATABASE_URL=postgres://postgres:password@127.0.0.1:5432/newsletter
	sqlx migrate add $(create_subscriptions_table)

.PHONY: migrate
migrate:
	echo "migrating..."
	SKIP_DOCKER=true ./scripts/init_db.sh
