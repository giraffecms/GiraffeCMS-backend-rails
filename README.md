[![Build Status](https://travis-ci.com/kuskoman/GiraffeCMS-backend-rails.svg?branch=master)](https://travis-ci.com/kuskoman/GiraffeCMS-backend-rails)
[![Maintainability](https://api.codeclimate.com/v1/badges/5365516c3e5989b2d969/maintainability)](https://codeclimate.com/github/kuskoman/GiraffeCMS-backend-rails/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5365516c3e5989b2d969/test_coverage)](https://codeclimate.com/github/kuskoman/GiraffeCMS-backend-rails/test_coverage)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/ff48f170b1c246c1baa162cb33d3937d)](https://www.codacy.com/app/kuskoman/GiraffeCMS-backend-rails?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=kuskoman/GiraffeCMS-backend-rails&amp;utm_campaign=Badge_Grade)

# GiraffeCMS Backend
GiraffeCMS is a simple headless CMS for blogging, written in Ruby on Rails. Unlike most of CMS's, Giraffe uses GraphQL instead of typical RESTful api.

Work under application is currently in progress, so it is not ready to work on production enviroment, as well as it has not implemented important features. All important relases should be aviable via tags in the future.

## Installation
### Prerequisites:
* Ruby 2.6.2
* PostgreSQL

### Set up Rails application
First, you need to install needed gems
~~~~shell
bundle
~~~~
Next you have to setup the database
~~~~shell
rails db:setup
~~~~
Because the app is using JWT it needs to have a secret key for its encoding. Probably, in current version of the application deleting file credentails.yml.enc may be required. Then, you need to fill rails credentails with valid data. You should be able to do it with command
~~~~shell
EDITOR="vim" bin/rails credentials:edit
~~~~
however, if you want to know more about encrypted credentials you can visit for example [this blog post about it](https://www.engineyard.com/blog/rails-encrypted-credentials-on-rails-5.2).

Required file structrue looks like following:
~~~~yml
secret_key_base:<base secret key>
jwt: <secret key used to encode JWT>
~~~~
You can generate a pseudorandom string with:
~~~~shell
rails secret
~~~~
and put it replacing <> marks in template above.

### Running app
To run app you can use command
~~~~shell
rails server
~~~~

### Running tests
To run tests using generated rspec binstub you need to use command
~~~~shell
rspec
~~~~
however, if your enviroment is different than test you may need to make setup for test database.
~~~~shell
rails db:setup RAILS_ENV=test
~~~~

# License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

# Documentation
Currently GiraffeCMS has not typical documentation. However, you should be able to access automatically generated docs via any GraphQL IDE, like:
* [Graphql Playground](https://github.com/prisma/graphql-playground)
* [GraphiQL](https://github.com/graphql/graphiql)

# Contributing
I appreciate every help with the project. Feel free to make pull requests, add issues, or contact me other way to propose changes.

# About

This project is created in learning purposes.