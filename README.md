Create your own swatch
======================

1. Download Bootstrap
------
Download and unpack [Bootswatch](https://github.com/thomaspark/bootswatch/tags). In terminal, navigate to `swatchmaker/` and run the command `make bootstrap` to update to the latest version of Bootstrap.


2. Install LESS
------
If you haven't already, install LESS to your machine via NPM. More information on that here: http://lesscss.org/#-server-side-usage


3. Customize Bootstrap
------
Make your customizations to the two files found in the `swatch` directory, `variables.less` and `bootswatch.less`.



4. Reset Bootstrap
------
If you want to reset `variables.less` and `bootswatch.less` to defaults, run `make default`.
