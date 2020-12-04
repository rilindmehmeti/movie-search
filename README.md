# README

This projects implements an external service(http://www.omdbapi.com) to search for movies for a given input from user. The front end uses `React`, there is only one api endpoint which is used to search for movies. 

The `api` searches in the external service, retrieves the information for movies, maps that information with `Movie` model and serves it in the front end.

The external service usage logic can be found under `lib/searcher`, where is implemented `OMBD` searcher, under `lib/searcher/error` are implemented errors related with searcher. The folder `lib/searcher/clients` holds implementation for clients that are used to handle http requests with the external service.

The business logic for the application is placed under `app/lib`, where an middleware layer is used to interact with api endpoints and data.

For unit tests `RSpec` is used, and respective tests can be found under `spec` folder. As well the projects implements `Rubocop` as linter. 

#### Requirements
* Ruby version `2.6.5`
* Bundler version `2.1.4`
* Yarn version `1.22.4`

#### Installation
* Run `bundle install`
* Run `yarn install`

#### Running tests
* Run `bundle exec rspec`
* Run `bundle exec rubocop`

#### Running Application
* Run `rails server`

#### Using the service (locally)
* Visit `localhost:3000`
* Fill in the search input with at least `4 letter` search term
* Hit search
