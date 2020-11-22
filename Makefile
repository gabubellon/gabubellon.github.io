clean:
	bundle exec jekyll clean

build:
	bundle exec jekyll build 

local-server:
	bundle exec jekyll serve

install:
	bundle install

build-prod:
	bundle exec jekyll clean
	bundle exec jekyll build 