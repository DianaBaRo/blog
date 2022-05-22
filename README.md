# Blog

Blog application where multiple users can create posts, comment on posts, and react to comments. The application provides a MySQL database and web interface for users to:

* Sign up, login or log out securely as an admin user or user
* List all posts made by one user
* Display a single post
* Create, update, and delete posts
* List all comments for a post together with the reactions on these comments
* Create, update and delete comments on one post
* Create and delete reactions for one comment

This blog application was built with Ruby '3.0.0' and Rails '7.0.3'


## Getting Started


### Prerequisites

* Ruby 3
* Rails 7
* bundler
* MySQL

### Installation

Run this blog in your local machine:

* Fork and clone this repository with HTTPS
* Open your terminal and change to the local directory where you want to clone your repository and run:

```
$ git clone + the link copied before
```

* Install gems:

```
$ bundle install
```

* Set up the database:

```
$ rake db:create
```

```
$ rake db:migrate
```

### Usage
* Run `rails s` and navigate to `http://localhost:3000`

```
$ rails s
```

* You can play with and create data via your console: `rails c`

```
$ rails c
```

### Test
* Run `rspec` to run test suite

```
$ rspec
```

### Linter
* Run `rubocop` to run RuboCop

```
$ rubocop
```

### Improvements

* Tests for controllers and integration tests
* Validation and flash erros not showing 
* Seeds
* Faker library would be good for generating data for testing purposes and seeds
* Take care of the front end

## Author

* **Diana Badas** - *Initial work* - [DianaBaRo](https://github.com/DianaBaRo)

## License

The app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).