# CarRentalApp
CSC517Program2

App Entity-Relationship Diagram

![ER_diagram](https://github.ncsu.edu/sli41/CarRentalApp/blob/master/ER_Diagram/relationship.png)


## Usage:

There are one Admin, one SuperAdmin and 100 Customer users present along with this app as default (shown in db/seeds.rb file). Any user signed up on the Home page are assigned as Customer status. To add more Admin or SuperAdmin, you should login using the Admin or SuperAdmin account info. Also, this app generate 50 car samples inside database to make car rental reservations.

To login as a Customer: 

      Email: example_customer@email.com
      Password: 123456
      
To login as default Admin:

      Email: root_admin@email.com
      Password: 123456
      
To login as default SuperAdmin:

      Email:  root_superadmin@email.com
      Password: 123456
      
Password of newly created user by Admin account is also "123456".

[Click here to use this app online!](https://car-rental-app-2017.herokuapp.com/)

## Reference:
[Rails Guides](http://guides.rubyonrails.org)

[RUBY ON RAILS TUTORIAL](https://www.railstutorial.org)

[Ruby on Rails: Authentication](https://www.codecademy.com/courses/rails-auth/)

[TutorialsPoint: Ruby on Rails Tutorial](https://www.tutorialspoint.com//ruby-on-rails/index.htm)
