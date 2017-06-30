
# README

Tree Status:
[![CircleCI](https://circleci.com/gh/milindl/leaderboard/tree/master.svg?style=svg)](https://circleci.com/gh/milindl/leaderboard/tree/master)

This contains the code for the leaderboard for Programming Club, IIT Kanpur.
Note that this repository is for the initial development period only, this
will eventually be shifted to an official PClub repository.

## Structure

Rails follows a familiar model-view-controller architecture for those who have
used Django or the like. The app itself is, unsurprisingly, contained in the app/
directory. The workflow of the app is as follows:

* `User`s can request `Ticket`s detailing what they have done and what points
they want for it. They need to provide their CC Password for authentication
purposed.
* `AdminUser`s can approve or disapprove tickets. There is no link on the site
for admin users to log in as of now, but you can log in using `/login` and
approve tickets on '/tickets/approve'
* Admin users can only be added thru rails console as of now, and that is
a good way to do it since there will be at most 4 admin users at any
time I think. To add an admin user for testing, type

```
$ bundle exec rails console
(rails console)> AdminUser.create(username: <username>, password: <password>, password_confirmation: <password>)
```

Note that you don't need to enter your CC password for this!

## Contributing

First, you need to install `ruby` on your system. The details depend on your
package manager, so you may need to check that. After installing you can
check by using

```
$ ruby --version
```

After this, you need to install `bundle`.

```
$ gem install bundle
```

After this, you should be ready to get started to run the actual application.


```
$ cd (directory where you cloned this repo, where the Gemfile is)
$ bundle install --without production
```

Next, migrate the database:

```
$ bundle exec rails db:migrate
```

Then, run it.

```
$ bundle exec rails server -p <port number, default is 3000>
```

It is recommended that you test your work before submitting a patch.

```
$ bundle exec rails t
```

Also, after adding any code it makes sense to check it using rubocop to validate style guidelines:

```
$ bundle exec rubocop
```

Note that failing rubocop leads to a failing build on our CI, thus your code will not be accepted.
