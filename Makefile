.PHONY: test

install:
	bundle install
	yarn install

test:
	bundle exec rake assets:precompile && bundle exec rake test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

db-reset:
	bundle exec rails db:drop
	bundle exec rails db:migrate
	RAILS_ENV=test bundle exec rails db:migrate
	bundle exec rails db:seed

migrate:
	bundle exec rails db:migrate
	RAILS_ENV=test bundle exec rails db:migrate

dev:
	bin/dev

deploy:
	git push heroku main

ac:
	bundle exec rubocop -a

cons:
	bundle exec rails c
