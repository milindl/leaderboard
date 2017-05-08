# README

To run this application and develop on it, follow these steps:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ bundle exec rails db:migrate
```

Then, run it.

```
$ bundle exec rails server
```


Admin users can only be added thru rails console as of now, and that is
a good way to do it since there will be at most 4 admin users at any
time.
