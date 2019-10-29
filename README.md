# README

* Ruby version: 2.6.3

* Rails version: 5.1.6

* System dependencies: There are no extraordinary dependencies and it should run out of the box.

* Cloning, Installing and Configuration: After cloning the repo in your local machine cd into your new folder, probably named rails-blockbuster.
Here you can use docker by running : $ docker-compose up --build
  * If you are not going to use docker some changes must be done in the database configuration.

* Database creation : docker-compose run --rm web rails db:create

* Database initialization : docker-compose run --rm web rails db:migrate  db:seed

* Accessing locally to all the endpoints:
  Once installed locally the API should be available at http://localhost:3000/api/v1/
  * An endpoint to return the movies, ordered by creation: http://localhost:3000/api/v1/contents.json?category=movie
  * An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number: http://localhost:3000/api/v1/contents.json?category=season
  * An endpoint to return both movies and seasons, ordered by creation: http://localhost:3000/api/v1/contents.json
  * An endpoint for a user to perform a purchase of a content (here you will need and API client like postman) Remember to use POST as method and add the id of the content to purchase: http://localhost:3000/api/v1/users/1/purchases?content_id=1
  * An endpoint to get the library of a user ordered by the remaining time to watch the content:  http://localhost:3000/api/v1/users/1/purchases

* How to run the test suite:
    * Remember to migrate the test database before running the test suite by executing: $ docker-compose run --rm db:migrate RAILS_ENV=test
    * And now you can run: $ docker-compose run --rm web rake




* Improvements:
With the idea of solving the challenge in a time cap of less than 5 hours I have focused my effort in delivering a working piece of code the fulfills the minimum requirements of the exercise. Unfortunately I had left some basic tasks in my TODO list for this project.
  * Extract to service objects User>Library, Purchase>validate_purchase_uniqueness, Purchase>set_expiration_date.
  * Extract to query objects all the queries in ContentsController>index.
  * DRY specs with before hooks for the creation of objects.
  * Adding a Job that checks for expired purchases and sets status to expired.
  * Use of cache to display the user's library.
  * Handle unhappy path properly (json custom error messages).
  * Handling serialization of json responses with custom serializer.
