## Author
[Alessandra Vertrees](https://github.com/avertrees)

## Demo 
In the works. Please stand by!

## Tech/Frameworks used
_**Back-end**_
* [Ruby on Rails](https://rubyonrails.org) - Server Framework
* [PostgreSQL](https://www.postgresql.org) - Database
* [Rest-Client](https://github.com/rest-client/rest-client)
* Auth using [JWT](https://jwt.io) and [bcrypt ](https://rubygems.org/gems/bcrypt/versions/3.1.12)
* [Firebase](https://firebase.google.com) for file storage

_**Front-end**_
* [React](https://reactjs.org/docs/getting-started.html) - JavaScript UI Framework
* [React Router DOM](https://reacttraining.com/react-router/web/guides/quick-start) - Routing Library for React 
* [react-firebase-file-uploader - npm](https://www.npmjs.com/package/react-firebase-file-uploader)
* [Semantic UI](https://react.semantic-ui.com/) - CSS Framework
* [Node.js](https://nodejs.org/en/) 
* [p5.js](https://p5js.org/) - Canvas drawing library

## Installation
1. Fork and clone this repo.
2. In your clone/fork of this repo:
* `bundle install`
* `rails db:create #creates database`
* `rails db:migrate #creates tables in db`
* `rails db:seed #creates seed data`
* `rails s #to run the server`

The instructions for the front-end of this app are [here](https://github.com/avertrees/entheogen-frontend). You'll need to clone/fork both repositories and change the fetch URLs if you want to change the API. Otherwise, the app will make calls to Heroku.