### Oceny

Ember.js app on Rails for rating applications of wannabe attendees.

#### Setup

1. Clone repository: `git clone git@github.com:szemek/oceny.git`
2. `bundle`
3. `cp .env.sample .env`
4. [Register a new OAuth application](https://github.com/settings/applications/new) and set `GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET` in `.env`
5. Set `SECRET_TOKEN` in `.env` (e.g. you can generate secret token by running `rake secret`)
6. Install [MongoDB](http://www.mongodb.org/downloads)
