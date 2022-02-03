install:
	bundle install

test:
	bundle exec rspec

lint:
	bundle exec rubocop
	bundle exec slim-lint

ac:
	bundle exec rubocop -a
