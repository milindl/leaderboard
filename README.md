# README

To run this application and develop on it, follow these steps:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ bundle exec rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ bundle exec rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ bundle exec rails server
```
