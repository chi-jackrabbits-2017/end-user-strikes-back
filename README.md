# End User Strikes Back!
Group project for DBC P2 Wk 2

Group Members: mikejtaylor, kheer1, tylersmall19, jfrederick12

### Group Norms

* Be Accountable
  * If you get stuck, ask!
  * Move your cards to 'review' when done

* Respect team member's time
  * We aren't all available 100% of the time
  * Make time for weekend work
  * Keep open, honest communication

* Stay Humble
  * Keep an open mind

* Respect your entire team
  * There's not a single name on the project
  * We all have differenge views on what we want

* Enjoy the project

* Allow time for other DBC work over weekendf
  * All weekend work is _optional_

* Checkin every 90-120 minutes (adjust as neccessary)
  * 9 AM
  * 11 AM
  * 12:30 PM
  * 2:00 PM
  * 3:00 PM
  * 4:00 PM
  * 5:00 PM
  * 6:00 PM

* Follow Git Guidelines

## User Stories

### User 1

'As a user, I should be able to create an account, log in!'

#### Acceptance Criteria

* Create users table
* Create User model
* Create validation method
* Create password virtual attributes
* Create login helper methods (current_user, logged_in?, authorized?)
* Create sessions route for login
* Create User-specific routes
* Create registration and login partials
* Allow Ajax support

### User 2

'As a User, when I log in, I should be able to easily ask a question!'

#### Acceptance Criteria

* Create questions table
* Create Question model
* Create questions/index page that displays all questions (reference board)
* Create partial to add a question
* Ajax call to display the form (get route)
* Ajax call to post the form (post route), save to the database, jQuery to hide form, display new question.

### User 3

'As a User, when logged in, I should be able to add a comment to a question'

#### Acceptance Criteria

* Create comments table
* Create Comment model
* When comments button is clicked, use jQuery to display all comments for question
* Create form partial to post a comment (post route)
* Ajax call to display the partial
* Ajax call to post the comment, update comments, jQuery to hide form
* Create display partial to layout each comment

### User 4

'As a User, when logged in, I should be able to add a comment to answers'

#### Acceptance Criteria

* When comments button is clicked, use jQuery to display all comments for answer
* Create form partial to post a comment (post route)
* Ajax call to display the partial
* Ajax call to post the comment, update comments, jQuery to hide form
* Create display partial to layout each comment

### User 5

'As a User, when logged in, I can edit/delete my questions'

#### Acceptance Criteria

* When logged in, show delete or edit button
* Create routes to handle deleting question
* Create routes to handle editing question
* Ajax call to display edit form (get route)
* Ajax call to properly edit (put route), update question, jQuery to hide form, display edited question to questions page

### User 6

'As a User, when logged in, I can upvote and downvote questions'

#### Acceptance Criteria

* Create votes table
* Create Vote model
* When user is logged in, display arrows (fa fa-arrow-up?) for upvote and downvote on questions
* When upvote is clicked, Ajax to create new vote, update vote count
* jQuery to change button color

### User 7

'As a User, when logged in, I can vote on answers'

#### Acceptance Criteria

* When user is logged in, display arrows (fa fa-arrow-up?) for upvote and downvote on answers
* When upvote is clicked, Ajax to create new vote, update vote count
* jQuery to change button color

### User 8

'As a User, when logged in, I can vote on comments'

#### Acceptance Criteria

* When user is logged in, display arrows (fa fa-arrow-up?) for upvote and downvote on comments
* When upvote is clicked, Ajax to create new vote, update vote count
* jQuery to change button color


### User 9

'As a user without an account, I want to be able to see the questions'

#### Acceptance Criteria

All questions are listed to a non-logged in user.

### User 10

'When I'm not logged in, I'd to to be able to see comments.'

#### Acceptance Critera

All comments can be extended no matter if the user is logged in or not.
