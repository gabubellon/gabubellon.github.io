clean:
	bundle exec jekyll clean

build:
	bundle exec jekyll build 

local: clean-build
	bundle exec jekyll serve

install:
	bundle install

clean-build: clean build