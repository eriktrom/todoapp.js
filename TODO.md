### TODO

- make generating a new app easy
  - allow choices, for example mocha and heroku
  - allow <%= pkg.name %> to be used inside the transpile configuration
- compress all assets into one file on build
- neuter files before compressing them
- make it so changing a dependency inside of index.html doesn't require changes in 3 locations. One inside test/index.html, one inside public/index.html and once inside karma.conf.js.
- run the tests on the production build, after the whole thing is ready, but before pushing to s3.  
- uglify css before deployment
- fix uglify not seeing files that have more than one `.` in their name