- Easy way to upgrade to the newest version of Ember

- Use Mocha for testing

- Add scss pipeline

- Use connect server instead of pow for public/index.html

- Handlebars pre-compilation
- Use emblem instead of handlebars
  - emblem pre-compilation


- source maps in development
- using non-minified files in dev
- add version numbers to script src files in dev for clarity
- 


- generating the index.html file
  - concatenate and minify script tag source files, meaning only load one file for production builds
  - neutered files for production
  - test before deploy(repeat from above)



Regarding the dependencies:
===========================
- how do i know which version of ember-data to use with x version of ember
- do i need worry about the version of handlebars and jquery
- Is this what something like ember-dev could help with? ember-gem? what about in the js world?



grunt-ember-templates
grunt-contrib-compass
grunt-contrib-copy

grunt-neuter
grunt-mocha

grunt-contrib-htmlmin
grunt-contrib-cssmin
grunt-contrib-imagemin
grunt-svg-min
grunt-contrib-uglify
grunt-rev (cache busting)
grunt-usemin (seems to build your html file for you)

grunt-open(superfluous)


grunt-contrib-concurrent ??


http://builds.emberjs.com.s3.amazonaws.com/index.html
http://builds.handlebarsjs.com.s3.amazonaws.com/index.html
