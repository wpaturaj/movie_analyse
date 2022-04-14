.DEFAULT_GOAL := help

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo ""
	@echo prepare-data   download and save data in database\data
	@echo build          run docker-compose up -d
	@echo up             run docker-compose up -d
	@echo logs           run docker-compose logs
	@echo down           run docker-compose down



prepare-data:
	curl https://files.grouplens.org/datasets/movielens/ml-latest-small.zip -o ml-latest-small.zip
	tar -xvf .\ml-latest-small.zip
	mv ml-latest-small database\data
	rm .\ml-latest-small.zip

build:
	docker-compose build

up:
	docker-compose up -d

logs:
	docker-compose logs

down:
	docker-compose down
