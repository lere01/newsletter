monitor:
	cargo watch -x check -x

completerun:
	cargo watch -x check -x test -x run

format:
	cargo fmt

start_db:
	bash scripts/init_db.sh