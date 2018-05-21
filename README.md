## api/

This directory contains a simple node app that responds to the root path on port 3001. To test it out locally, run:

```
# in api/
node server.js
curl localhost:3001
```

## frontend/

This directory contains a rails 5.2 application. It requires:

- ruby >= 2.3
- npm
- mysql database (check config/database.yml for config options)
- other random libs

To test it out locally, run:

```
# in frontend/

bundle install
bundle exec rake db:create db:migrate
bundle exec rails s
```

You will see a page that tells you whether your app is connected to mysql, has webpack compiling its javascript, and is able to connect to the node api server.
