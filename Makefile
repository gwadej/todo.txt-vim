DIRS=doc ftdetect syntax
todotxt.tar.gz:
	tar -zcvf todotxt.tar.gz --exclude '*.swp' $(DIRS)

deploy:
	rsync -av --exclude '*.swp' $(DIRS) $(HOME)/.vim
