start:
	docker-compose up -d
stop:
	docker-compose down -v --remove-orphans
restart:
	docker-compose down -v --remove-orphans
	docker-compose up -d
test:
	docker container exec -it giraffe-api rspec
migrate:
	docker container exec -it giraffe-api rails db:migrate
db-reset:
	docker container exec -it giraffe-api rails db:drop db:migrate