# Dokterku

## Introduction

Dokterku is a web application built for hospitals and general patients. It's built using Ruby on Rails. It's basic features are the following:

  - There will be a “Hospital” model for each hospital using the application. New hospitals can be created and existing ones can be modified or deleted.
  - Each “Hospital” will have several “Admins”, “Nurses” and “Doctors” for each admin, nurse and doctor working in that hospital. Basic CRUD functions will apply to these models.
  - Each “Admin”, “Nurse” and “Doctor” will have their own profile which they can log into using their email and password. Access to confidential information will only be available to a logged in user.
  - An “Admin” will be able to create a new “Patient” for each patient enrolled in that hospital. Basic CRUD functions will also apply to this model.
  - A “Nurse” or “Doctor” will only be able to add “Notes” to that patient and view the patient’s profile. But they won’t have create, update or delete rights.
  - An “Admin” can also create a “Scheduling System” for their hospital.
  - Each “Doctor” will be able to register their business and create a profile.
  - Users can search and filter the list of “Doctors” and see their profile information

## Tech Stack

This app is built using:

  - Ruby 2.x
  - Ruby on Rails 4.x
  - PostgreSQL
  - HTML5
  - ERB
  - CSS3
  - Sass
  - JavaScript
  - CoffeeScript
  - jQuery
  - Twitter Bootstrap
  - Devise
  - RSpec
  - Capybara
  - FactoryGirl
  - Git
  - Heroku

## Installation Instructions

  - Make sure you have Ruby and Ruby on Rails installed
  - Clone this repository into your local machine:

    ```
    $ git clone git@github.com:oiffel/dokterku-apis.git
    ```

  - Then change to the directory you just cloned:

    ```
    $ cd dokterku
    ```

  - Install all the Gems and their dependencies

    ```
    $ bundle install
    ```

  - Edit `database.yml` and add your own PostgreSQL username, password and other configurations
  - Edit `secrets.yml` and add your own secrets key. You can generate Rails secrets keys by running `rake secret`
  - Setup and migrate the database:

    ```
    $ rake db:setup
    ```

  - Finally, fire up the WEBrick server

    ```
    $ rails server
    ```

Once the server is up and ready to receive connections, visit [http://localhost:3000/](http://localhost:3000) in your browser and you'll see the app up and running.
