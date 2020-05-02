clean:
	bundle exec jekyll clean

build:
	bundle exec jekyll build 

devserver:
	bundle exec jekyll serve

install:
	bundle install

toprod:
	bundle exec jekyll clean
	bundle exec jekyll build 