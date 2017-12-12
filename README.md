

# CarRentalApp
 __Important Note: App only supports CHROME and FIREFOX browsers!!!__

<a href="https://car-rental-app-2017.herokuapp.com/" target="_blank">Click here to open this App!</a>

Features:
* Multi-status user management
* User-friendly car search and management
* Flexible reservation and waitinglist
* Automatic email notification and system message

## Design

App Entity-Relationship Diagram

<img style="center" src="https://github.com/jerry-shijieli/CarRentalApp/blob/master/ER_Diagram/relationship.png" height="400" />


## Usage

There are one Admin, one SuperAdmin and 100 Customer users shipped along with this app as default (shown in db/seeds.rb file). Any user signed up on the Home page are assigned as Customer status. To add more Admin or SuperAdmin, you should login through the default Admin or SuperAdmin account. Also, this app generate 10 customer samples and 50 car samples inside database to make car rental reservations.

To login as a Customer: 

      Email: example_customer@email.com
      Password: 123456
      
To login as default Admin:

      Email: root_admin@email.com
      Password: 123456
      
To login as default SuperAdmin:

      Email:  root_superadmin@email.com
      Password: 123456
      
Password of newly created user by Admin account is always "123456".

### Sign up

Home page (or click logo) >>> Sign up now! button >>> Fill user info as instructed on page.

### Log in

Click on "Log in" on the nav bar >>> Enter email and password as instructed;

### Log out

Click on account management link (Root Admin, Example Customer, Admin  button depending on actual role of user) on nav bar to display a dropdown >>> Click on logout to logout.

### Checking profile

Click on account management link on nav bar to display a dropdown >>> Click on profile to show user information.

### Edit profile

Retrieve profile through checking profile steps above >>> Click on "Edit" >>> Modify information >>> Click "Submit".

Also you can click "Setting" on the account dropdown menue in nav bar.

### Search and view cars

Click on "Cars" on the nav bar to display a dropdown >>> Click on "Search & view cars" to open car-searching page >>> Input searching criteria and click search to retrieve results >>> Clicking on links under "Licenseplatenumber" to view information of an individual car; When accessing information of specific car, a customer can only reserve the car for himself or herself by clicking on "Reserve" link then entering information required on form page that is been redirected to, or going back to the listing; whereas an admin can reserve the car for someone else not limited to himself or herself by clicking on the "Reserve" link and fill in the information needed, edit a car by modify the information in car form that is been redirected to, delete a car by confirming the alert box on the page, or going back to listing.

If a car is checked out, the program will prevent it from being deleted.

### Search and view reservation

Click on "Reservations" on nav bar to display a dropdown >>> Click on "Search & view reservations" to view all reservations and their status >>> Click on "show" to view reservation details of specific reservation.

The reservation listing differs between admin and customer; whereas customers can only view the reservation and its detail, the admins also can view that which customer have made specific reservation and which car the reservation is on; the admins can also view information of customer or car related to specific reservation by accessing the links on customer username and car license plate. Admins can search for reservation by customer names as well as car license plate number, where as customer can only search by car license plate number. The result of search would then be posted in result section below search condition fields with detailed reservation properties.

To view reservations, available, clicking on "Search & view reservations" under "Reservation" pull-down in nav bar. For customer, it will display the reservation/checkout history of the customer; for admin, it will show reservation/checkout history of everyone as a whole.

### View waitinglist

Click on "Reservations" on nav bar to display a dropdown >>> Click on "View waitinglist" to show the reservation waitlist >>> Click on "Show", "Edit", and "Destroy" to the right of each record to show status of a reservation, add a new reservation, and delete the target reservation.

For admins, they can also view who made the reservation or which car is reservation targetting by clicking on the links under "user" or "car" columns; for a customer, they can only view waitlist of his or her own reservations and performing actions on it.

### Add new reservation

Click on "Reservations" on nav bar to display a dropdown >>> Click on "Add new reservation" to be redirected to "View and search cars" page >>> Choose a car to be reserved by clicking on its license plate number, then click "Reserve" and fill in the information needed for reservation.

### Operations by Admin user

#### Search and view user:
Click on "Users" in nav bar to display a dropdown, then click "Search & view users" >>> Input name of user in interest in "Name" field, and select
the type of user to be searched in "Role" dropdown list, the click "Search" button >>> Go through listing result to find target user, and select the
name displayed under "Name" column to show detailed information of an user.

#### Manage an user:
Find the user through above step and click open the link under "Name" field >>> Click "Edit" to show a form with current user information occupied in >>> Modify user information, then click "Submit" Button. 

Note, the admins have no privilege to delete an admin user, only super admins have the privilege of performing such operation. Also, the program will prevent any user with outstanding checkout from being deleted.

#### Add user:
Click on "Users" in nav bar to display a dropdown, then click "Add new user" >>> Fill in information of user on form shown, then click "Submit".

#### Checking user profile:
Follow operation on Search and view user above;

#### Deletion of unavailable cars:
Follow operation on Search and view cars >>> Click on license plate of the car >>> Click "Delete";
If the current car is not available (checked out, etc) and admin is trying to delete it, the system will check the car status before the delete action to prevent such deletion. In addition, the system will display an alert message in red color. Once the car is available, the admin can safely delete the user.

#### Deletion of unavailable users:
Follow Manage an User above >>> Click on the username under "Name" column >>> Click "Delete";
If the current user is involved in any active reservation, the admin will not be allowed by the system to delete the user. And it will display an alert message in red about the reason. 

#### Add new car:
Click on "Cars" in nav bar to pull down a dropdown >>> Select "Add new car" option >>> Fill in the form of new car's information, then click "Submit car info".

### Operations by Customer user

#### Suggest new car:
Click on "Cars" in nav bar to pull down a dropdown >>> Select "Suggest new car" option >>> Fill in the form of new car's information, then click "Submit car info", it will then send an email to notify admin;

## * Extra Credit Features

###  Notification email setting
When a car status change, an email would be sent to the user who have add an email notification on this car;

###  Car suggestions
See Suggest new car above.

## App Link

[Click here to use this app online!](https://car-rental-app-2017.herokuapp.com/)

## Team Contributions

Shijie Li (sli41@ncsu.edu)

Wei Sun (wsun12@ncsu.edu)

Leiyang Guo (lguo7@ncsu.edu)

*Please check repo master and branches for details.*

## Reference
[Rails Guides](http://guides.rubyonrails.org)

[RUBY ON RAILS TUTORIAL](https://www.railstutorial.org)

[Ruby on Rails: Authentication](https://www.codecademy.com/courses/rails-auth/)

[TutorialsPoint: Ruby on Rails Tutorial](https://www.tutorialspoint.com//ruby-on-rails/index.htm)
