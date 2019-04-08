source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem "sqlite3", "~> 1.3.6"
gem 'bootsnap', '>= 1.1.0', require: false
gem 'graphql', '~> 1.8', '>= 1.8.13'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'jwt', '~> 2.1'

group :development, :test do
	gem 'rspec-rails', '~> 3.5'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.1'
	gem 'shoulda-matchers', '~> 3.1', '>= 3.1.3'
  gem 'faker', '~> 1.9', '>= 1.9.1'
  gem 'database_cleaner', '~> 1.7'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'graphiql-rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
