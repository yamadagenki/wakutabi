
deploy:
	bundle exec ruby generate_pages.rb
	rm -rf _site
	rm -rf docs
	gulp build
	mv _site docs
	git add .
	git commit -m "add: contents `date`"
	git push origin master
