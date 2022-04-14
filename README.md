## Movie Analyse

Project contains setup of an environment and analyses of movies from https://grouplens.org/datasets/movielens/latest/

Structure of a project

```
movie_analyse
│   README.md
│   Makefile  
│   docker-compose.yml
|
└───analytics
|   |   Dockerfile                         # Dockerfile for setup jupyter
│   │   notebooks
|   |   |   movies_film_analyse.ipynb      # notebook with analyses
|   
└───database
|   |   Dockerfile                         # Dockerfile for setup database
│   │   setup.sql                          # SQL for creating, reading and preprocessing tables
```

## How to setup envinronment?

When you clone the repository, you can start from running 

```bash
make
```
and then you see following help context:
```bash
prepare-data   download and save data in database\data
build          run docker-compose up -d
up             run docker-compose up -d
logs           run docker-compose logs
down           run docker-compose down
```

First of all we must to download data to import them to database. We do it by running
```bash
make prepare-data
```

In the next step we need to define *.env* file which should contain following variables
```
POSTGRES_DB=
POSTGRES_USER=
POSTGRES_PASSWORD=
```

After that you can build images by running command
```bash
make build
```

and run the containers by 
```bash
make up
```


## What is needed to improve?
- analyse root priviligies in database image
- use pandas to read data in notebooks