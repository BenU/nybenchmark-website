RUBY := /opt/homebrew/opt/ruby/bin/ruby
BUNDLE := $(RUBY) -S bundle
BLOG_BUILD_DIR := /tmp/benchmarkusa-blog-site

serve:
	$(BUNDLE) exec jekyll serve --livereload

install:
	$(BUNDLE) install

build:
	$(BUNDLE) exec jekyll build --disable-disk-cache

build-benchmarkusa-blog:
	$(BUNDLE) exec jekyll build --disable-disk-cache --config _config.yml,_config_benchmarkusa_blog.yml --destination $(BLOG_BUILD_DIR)
