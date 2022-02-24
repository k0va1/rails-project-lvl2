.PHONY: test

install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

migrate:
	bundle exec rails db:migrate
	RAILS_ENV=test bundle exec rails db:migrate

dev:
	bin/dev

deploy:
	git push heroku main

ac:
	bundle exec rubocop -a
