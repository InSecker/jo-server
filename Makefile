.PHONY: local
local:
	docker-compose up -d
	./bin/console server:start

hydrate:
	./scripts/mysql_hydrator.sh

stop:
	docker-compose down
	./bin/console server:stop
