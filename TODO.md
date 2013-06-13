### TODO

- make generating a new app easy
  - allow choices, for example mocha and heroku
  - allow <%= pkg.name %> to be used inside the transpile configuration
- compress all assets into one file on build
- neuter files before compressing them
- make it so changing a dependency inside of index.html doesn't require changes in 3 locations. One inside test/index.html, one inside public/index.html and once inside karma.conf.js. Index.html should remain relatively stable after setup, however, that makes it that much more likely to get out of date. Adding a micro lib would require those 3 changes at this point. In a better worl, perhaps we should make a grunt task that concatenates dependencies, and we list the dependencies(order is important) in one place, then require them in those 3 places, which when broken into test.js and app.js, would be easy to manage. As a side benefit, we'll fix the issue where we're loading numerous more than one .js file in production. Don't forget to neuter the production file though. 
- run the tests on the production build, after the whole thing is ready, but before pushing to s3.  
- consider renaming things like todoapp.js and todoapp.css to application.js, application.css. This would make porting the grunt code to a different application more seamless.
- uglify css before deployment
- throw an error or fix the fact that any filename with something.something-anything.js does not uglify and therefore throws an error when being loaded into index.html
- figure out a way to invalidate index.html on cloudfront pragmatically, or if using a md5 version is possible when setting the root object.
- explain ssl certificate. ensure i'm not being charged for the automatic one setup by cloudfront. I think you only get charged when you register your own with ami, yet to be determined. 