serve:
	bundle exec jekyll serve --livereload

install:
	bundle install

build:
	bundle exec jekyll build

build-benchmarkusa-blog:
	bundle exec jekyll build --config _config.yml,_config_benchmarkusa_blog.yml
