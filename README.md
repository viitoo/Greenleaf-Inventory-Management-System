# TS Inventory Management\Business Solution (TIMBS).

TIMBS is a ongoing project for the creation of a better inventory management solution for keeping track of workstations and general inventory at Greenleaf Hospitality Group. This is built upon the [RIMS framework ](https://github.com/DamageStudios/rims) which is an open source project


### Project Status
This project is currently in an early alpha stage. Code quality is improving constantly. However, this project is not ready for production yet.

### Installation

`bundle install`

`rake db:create && rake db:migrate && rake db:seed`

`rails s`

This will install all the gem dependencies for you, create a local database, run the database migrations and seed the database with some default items. It will also create an admin and a regular user for you to login as. The credentials for this user are:

**Admin User**
```
username: admin1@example.com
password: changeme
```
**Regular User**
```
username: user1@example.com
password: changeme
```

If you want to run unit tests you can do so by running the following command:

`bundle exec rspec spec/`


### ToDo

* Allow for way to mass add similair models

* Improve documentation & formatting of all files

* Link to AD

* Create Reports and alerting on warrenty date

### Finished TODO

* Add Importing CSV option

* Create an error page

* Prevent creation of item if no property/department chosen

* Make so it goes back to creation page of item if no property selected, or if SN or device name used.

* Add dynamic property and department tag

* Fix Searching functionality

* Block Duplicate SN & Device Names

* Remove Price & Picture options

* Default Quantity to 1 but still editable

* Add button for new inventory to All Inventory page

* Add department and property dropdowns for new inventory
