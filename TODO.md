### TODO

- make generating a new app easy
  - allow choices, for example mocha and heroku
  - allow <%= pkg.name %> to be used inside the transpile configuration
- cleanup build process, reduce redundancy/confusion of where to place the index.html task. Right now it depends on whether your building for production or development
- Remove the need to state the env as production when deploying. This should evident by the fact that you want to deploy.
- Explain/find the best way to store env variables, for example, s3 keys for a project/person. Put that in the README.
- compress all assets into one file on build
- neuter files before compressing them
- make this todo list more of a step by step process instead of a bunch of random notes that might require me to remember stuff a long time from now
- add support for using karma