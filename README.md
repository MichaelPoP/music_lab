Music Lab
=========

In this lab you'll be creating a web application for saving some of
your favorite music.  You can keep track of your favorite Artists and
your favorite Songs (as part of the bonus). Naturally, you'll be able to
Create, Read, Update, and Delete these resources.

This will be a Sinatra app and we will be utilizing our newfound
knowledge of ActiveRecord. We will be using ActiveRecord to create
our database, create tables, and interact with the database.

Research
--------

Before you start coding, look up the answers the following questions
and place them inline below:
__________________________________________________________________
1. What are some books that Martin Fowler has written?
__________________________________________________________________
>noSQL Distilled, Refactoring, Domain Specific Languages, Refactoring, Patterns of Enterprise Application Architecture, UML Distilled, Refactoring Ruby Edition, Analysis Patterns, Planning Extreme Programming
__________________________________________________________________
2. What's the difference between "active record" and "ActiveRecord"?
__________________________________________________________________
>’active record’ is a gem, and is not capitalized; “ActiveRecord” is a library, is one word and is not capitalized.
__________________________________________________________________
3. Is the "active record" pattern an ORM?
__________________________________________________________________
>The “active record” ‘pattern’ implements Object-relational mapping but it is not itself an ORM. It takes the tables from a database and combines them with persistent objects in an object-oriented framework. The objects are created through ruby while sinatra accesses the database; active record acts as the middle-man between ruby and sinatra in ruby’s model-view-controller framework by acting as the ‘model’ component. Active record does this with an ORM pattern but includes inheritance and associations. 
__________________________________________________________________
4. Why might we want to use an ORM in our code?
__________________________________________________________________
>An ORM would have lots of uses in any website or application that uses a database that is supposed to have some relationship to user requests or with other types of data sets. Put more clearly, Object Relational Mapping takes data from a database, that is requested by a user on some interface, and turns it into a set of ’virtual’ objects so that the user can do what they need with it (whether that is just viewing or deleting etc.) even when the type of language or system they are making the request with is different.
__________________________________________________________________
5. What gem do we need to allow Sinatra to interact with ActiveRecord?
__________________________________________________________________
>’sinatra-activerecord’
__________________________________________________________________
6. What is `rake`?
__________________________________________________________________
>
__________________________________________________________________
7. What is a database migration?
__________________________________________________________________
>Migration allows you to use Ruby to define changes to your database schema. More basically, it allows you to make and alter a database that is being used by your application.
__________________________________________________________________
8. What command can we use to create a new ActiveRecord migration?
__________________________________________________________________
>
__________________________________________________________________
9. What command runs our existing migrations?
__________________________________________________________________
>
__________________________________________________________________
10. What commands reverses a migration?
__________________________________________________________________
>
__________________________________________________________________
11. What command tells us which migrations have run and which have not?
__________________________________________________________________
>
__________________________________________________________________
12. Which class do we have to extend if we want to create a new model?
__________________________________________________________________
>
__________________________________________________________________
13. What's the difference between ActiveRecord's `.new` and `.create` methods?
__________________________________________________________________
>
__________________________________________________________________
14. What's the difference between ActiveRecord's `.find` and `.find_by` methods?
__________________________________________________________________
>
__________________________________________________________________
15. What's the difference between ActiveRecord's `.find_by` and `.where` methods?
__________________________________________________________________
>
__________________________________________________________________
16. What ActiveRecord method do we use to change a value in the database?
__________________________________________________________________
>
__________________________________________________________________
17. What ActiveRecord method do we use to remove an item from the database?
__________________________________________________________________
>
__________________________________________________________________


Steps
-----

### Create a Sinatra app.

Forget about ActiveRecord for this first step. Just get a Sinatra app
up and running, make sure it works, and then commit it to Git.

### Integrate ActiveRecord into your app.

Take your working Sinatra app and integrate ActiveRecord.

- Use the `sinatra-activerecord` gem.
- Create the `Rakefile` to make `rake` tasks available.
    - `rake -T` should list all the available tasks if setup properly.
- `rake db:create` should create your database if
`config/database.yml` is setup properly.

### Create the Artists table

- Create an ActiveRecord Migration for creating the Artists table.
    - Hint: `rake -T` might help you remember how.
- You'll need to run the migration in order for the table to actually
  be created.

### Create all the CRUD routes for Artists.

- GET
    - `/artists` - reads all artists
    - `/artists/new` - display a form to create a new artist
    - `/artists/:id` - reads a single artist
    - `/artists/:id/edit` - display a form to edit an artist
- POST
    - `/artists` - create a new artist in the database
- PUT
    - `/artists/:id` - update the artist with the given id.
- DELETE
    - `/artists/:id` - remove an artist from the database.

This will feel very similar to your Squad lab refactor, but instead of
writing SQL or writing your own ORM, you should use ActiveRecord to
talk to the database. For instance, instead of writing  `@conn.exec
"SELECT * FROM artists"` or implementing your own `Artist.all`, you
should use the `Artist.all` that comes built-in to ActiveRecod. Of
course, in order to do this you'll need to create the `Artist` class
that extends `ActiveRecord::Base`.

Bonus
-----

The bonus is to implement the Songs component of this app. You should
be able to add Songs to an Artist. Put another way, Artist has a
1-to-many relationship with Songs. How do you express relationships
within ActiveRecord? Implement full CRUD operations on Songs.

### Steps

You'll need:

- a migration to create the `songs` table.
- a foreign key in the `songs` table referencing the `artists` table.
- a `Song` model class
- routes such at `/artists/:artist_id/songs`,
  `/artists/:artist_id/songs/:id`, etc.

Even More Bonus
---------------

- Style it. It never hurts to practice your design skills.
- Use a `seeds.rb` file to help populate the database with initial values.
