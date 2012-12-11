#
# BUILD BOOTSWATCH SWATCH
#

OUTPUT_PATH = swatch

bootswatch:
	lessc swatchmaker.less > ${OUTPUT_PATH}/bootstrap.css
	lessc --compress  swatchmaker.less > ${OUTPUT_PATH}/bootstrap.min.css
	lessc swatchmaker-responsive.less > ${OUTPUT_PATH}/bootstrap-responsive.css
	lessc --compress  swatchmaker-responsive.less > ${OUTPUT_PATH}/bootstrap-responsive.min.css

bootstrap:
	-test -d bootstrap && rm -r bootstrap
	curl --location -o latest_bootstrap.tar.gz https://github.com/twitter/bootstrap/tarball/master
	tar -xvzf latest_bootstrap.tar.gz
	mv twitter-bootstrap* bootstrap
	rm latest_bootstrap.tar.gz

fontawesome: bootstrap
	-test -f bootstrap/less/font-awesome.less && rm bootstrap/less/font-awesome.less
	-test -f swatch/font-awesome-ie7.css && rm swatch/font-awesome-ie7.css
	-test -d swatch/font && rm -Rf swatch/font
	curl --location -o latest_fontawesome.tar.gz https://github.com/FortAwesome/Font-Awesome/tarball/master
	tar -xvzf latest_fontawesome.tar.gz
	mv FortAwesome-Font-Awesome*/less/font-awesome.less bootstrap/less
	sed -i -e 's/@import "sprites\.less";/@import "font-awesome.less"; \/\/"sprites.less"/g' bootstrap/less/bootstrap.less
	sed -i -e "s/'..\/font';/'font';/g" bootstrap/less/font-awesome.less
	mv FortAwesome-Font-Awesome*/css/font-awesome-ie7.css swatch
	mv FortAwesome-Font-Awesome*/font swatch
	rm -Rf FortAwesome-Font-Awesome*
	rm latest_fontawesome.tar.gz

test:
	cp -R ${OUTPUT_PATH}/{*.css,font} bootstrap/docs/assets/css/
	open bootstrap/docs/index.html

default:
	-test -f swatch/variables.less && rm swatch/variables.less
	-test -f swatch/bootswatch.less && rm swatch/bootswatch.less
	curl --location -o swatch/variables.less https://raw.github.com/twitter/bootstrap/master/less/variables.less
	curl --location -o swatch/bootswatch.less https://raw.github.com/thomaspark/bootswatch/master/swatchmaker/swatch/bootswatch.less
	make bootswatch

.PHONY: bootswatch bootstrap fontawesome default test
