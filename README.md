# _Shoe store_

#### _Ruby week4 independent project, 05/12/2017_

#### By _**Chitroopa Manikkavasagam**_

## Description

_This application tracks shoe brands and the stores they are in._

_The following user stories are completed:_

* _As a user, I want to be able to add, update, delete and list shoe stores._
* _As a user, I want to be able to add and list new shoe brands. Shoe brands should include price._
* _As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands)._
* _As a user, I want to be able to add existing shoe brands to a store to show where they are sold._
* _As a user, I want to be able to associate the same brand of shoes with multiple stores._
* _As a user, I want to be able to see all of the brands a store sells on the individual store page._
* _As a user, I want the price to be in currency format even if I just inputted a number. (In other words, typing in 50 should be updated to $50.00.)_
* _As a user, I do not want stores and/or shoe brands to be saved if I enter a blank name._
* _As a user, I want all stores and brands to be unique. There shouldn't be two entries in the database for Blundstone._
* _As a user, I want store and brand names to have a maximum of one hundred characters._


Installation
------------

```
$ git clone https://github.com/Chitroopa/Shoe-store
```

Install required gems:
```
$ bundle install
```

Start postgres:
```
$ psql
```

Create databases:
```
$rake db:create
$rake db:migrate
```

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.


## Known Bugs

_NA_

## Technologies Used

_Ruby, HTML, CSS_

_Ruby gems : Sinatra, pry, capybara, rspec,rake_

### License

*MIT*

Copyright (c) 2017 **_Chitroopa Manikkavasagam_**
