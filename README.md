# Mlabs Test Rafa

Arroxa

#Links:
## Backend
https://github.com/mlabssoftware/mlabs-teste/blob/master/back-end.md

##Frontend
https://github.com/mlabssoftware/mlabs-teste/blob/master/front-end.md

##run:

```sh
sudo docker-compose up --build
```

In other shell run:

```sh
sudo docker-compose exec server bundle exec rake db:create
sudo docker-compose exec server bundle exec rake db:migrate
```

Visit on browser http://localhost:3000/v1/ping

##run tests:

```sh
sudo docker-compose up
sudo docker-compose exec -e OTR_ENV=test server bundle exec rake db:migrate
sudo docker-compose exec server bundle exec rspec
```