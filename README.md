timetracking
============

Logging of time spent on tasks

Some Setup
----------

```
git config commit.template ./template.json

bundle install
```

```rails s``` to run the app.

Setup with script
-----------------

```bash
$ curl -sSL https://raw.githubusercontent.com/CrazyHorseHQ/timetracking/gettracker/gettracker.rb > gettracker.rb
$ chmod u+x gettracker.rb
$ ./gettracker.rb
```

The script will
* Install the repo into $HOME/.timetracking
* Setup the executable `track`
* Show you how to setup the githook (manually for now)

Recording time
--------------

To record time you've spent on a task then make an empty commit with any of the options below in the message.

To make an empty commit: ```git commit --allow-empty```

Add a nice alias for it in ~./bash_profile: ```alias come='git commit --allow-empty'```

```
{
  project: "midwife",
  time: 60,
  type: "coding, meeting"
}
```

TODO: Write a client app to parse and display this info.
