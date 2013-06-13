### TODO

- make generating a new app easy
  - allow choices, for example mocha and heroku
  - allow <%= pkg.name %> to be used inside the transpile configuration
- compress all assets into one file on build
- neuter files before compressing them
- make it so changing a dependency inside of index.html doesn't require changes in 3 locations. One inside test/index.html, one inside public/index.html and once inside karma.conf.js. Index.html should remain relatively stable after setup, however, that makes it that much more likely to get out of date. Adding a micro lib would require those 3 changes at this point. In a better worl, perhaps we should make a grunt task that concatenates dependencies, and we list the dependencies(order is important) in one place, then require them in those 3 places, which when broken into test.js and app.js, would be easy to manage. As a side benefit, we'll fix the issue where we're loading numerous more than one .js file in production. Don't forget to neuter the production file though. And we'll likely want to run the tests on the production build, after the whole thing is ready, but before pushing to s3.  