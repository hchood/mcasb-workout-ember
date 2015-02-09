## MCASB Workout App

### Overview

This project is a workout app for actors. Users will be able to build "workouts" from a catalog of acting exercises and track their workout completions. It is built with the following tools:

* [rails-api](https://github.com/rails-api/rails-api)
* [ember-cli](http://www.ember-cli.com/)
* [ActiveModel Serializers](https://github.com/rails-api/active_model_serializers)

### Setup

Make sure you have all the necessary tools installed:

```no-highlight
# make sure Homebrew is up to date
brew update

# install node via Homebrew
# (this also installs npm, the node package manager,
# which we will use to install other tools we need)
brew install node

# install watchman
brew install watchman

# install bower
npm install -g bower

# install ember-cli
npm install -g ember-cli
```

Then set up the app:

```no-highlight
# clone the repo
git clone git@github.com:hchood/mcasb-workout-ember.git

# bundle & set up the database
cd mcasb-workout-ember/backend
bundle
rake db:create && rake db:migrate && rake db:seed

# run the ember & rails servers using a rake task
cd ..
rake run
```

You can access the Ember app at [http://localhost:4200](http://localhost:4200).
