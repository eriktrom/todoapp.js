A remake of the emberjs todo app from emberjs.com, with a focus on testing, javascript build tools and easy deployment. Currently it uses CoffeeScript for code readability.


### Make it go on your machine
1. `npm install --save-dev`
2. `grunt server`
3. Go to [localhost:8000/test](localhost:8000/test) for test runner.
4. Go to [localhost:8000](localhost:8000) to use the app.

### Make it live on the web
1. Create a new cloud front distribution using the amazon aws web interface. Set your `Default Root Object` to `index.html` during setup.
2. Copy the domain name cloud front gives you into your `package.json` file: `"cloudfrontHost": "http://d2r0e4vnm570z9.cloudfront.net"` <-- that's mine, you'll need your own
3. On the command line run: `S3_KEY=your_key_here S3_SECRET=your_secret_here grunt deploy` <-- don't forget your own s3 key and secret.
4. Visit your app on the web at `http://given_by_cloudfront.cloudfront.net`
5. *Optionally*, set a CNAME for the app in cloudfront and point to it from your DNS zone file(e.g. inside godaddy)

[TODO](https://github.com/trombom/todoapp.js/blob/master/TODO.md)