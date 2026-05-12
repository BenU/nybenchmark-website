BUNDLE := $(HOME)/.rbenv/shims/bundle
BLOG_BUILD_DIR := /tmp/benchmarkusa-blog-site
BLOG_CONFIG := _config.yml,_config_benchmarkusa_blog.yml

serve:
	$(BUNDLE) exec jekyll serve --drafts --config $(BLOG_CONFIG)

install:
	$(BUNDLE) install

build:
	$(BUNDLE) exec jekyll build --disable-disk-cache

build-benchmarkusa-blog:
	$(BUNDLE) exec jekyll build --disable-disk-cache --config _config.yml,_config_benchmarkusa_blog.yml --destination $(BLOG_BUILD_DIR)
