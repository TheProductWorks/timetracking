timetracking
============

Logging of time spent on tasks

Some Setup
----------

```
git config commit.template ./template.json
```

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
