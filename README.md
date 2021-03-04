# Crawler Notícias
![GitHub top language](https://img.shields.io/github/languages/top/LukasPol/crawler-noticias)
![GitHub language count](https://img.shields.io/github/languages/count/LukasPol/crawler-noticias)
![GitHub repo size](https://img.shields.io/github/repo-size/LukasPol/crawler-noticias)

Click here to visit: [Crawler-noticias](https://crawler-noticias.herokuapp.com)

## Pre-requisites

**Recommend**
- Docker and Docker Composer

or
- Ruby ~> 2.7.2
- Rails ~> 6.0.3
- Postgres ~> 12.6
- Node ~> 13.12.0
- Yarn ~> 1.22.5
- Webpacker

## Setup project with docker

1. `$ git clone https://github.com/LukasPol/crawler-noticias.git`
1. `$ cd crawler-noticias`
1. `$ cp .env.sample .env`
1. `$ docker-compose build`
1. `$ docker-compose up` (you can use the flag `-d`)
1. `$ docker-compose exec webcrawler bash`
1. `$ rake db:create`
1. `$ rake db:migrate`
1. `$ rails s -b 0.0.0.0`

Open in browser [http://localhost:3000](http://localhost:3000)


## Setup project without docker
1. `$ git clone https://github.com/LukasPol/crawler-noticias.git`
1. `$ cd crawler-noticias`
1. `$ cp .env.sample .env`
1. Set your username and your password and your host database
1. `$ bundle install`
1. `$ yarn install`
1. `$ rake db:create`
1. `$ rake db:migrate`
1. `$ rake db:seed`
1. `$ rails s`

Open in browser [http://localhost:3000](http://localhost:3000)

## Services

I created two services,

 - a service for scraping the Cultura page;
 - another service for scraping the Desenvolvimento page;