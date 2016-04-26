# legal-aid
A web app for law firms built with Ruby on Rails

todo:

use bootstrap to fix columns?(will this over write my current css)

owners and admins can delete notes => this is working but not with the authorize @record method. not sure why?


maybe: 

automatic file number gen

SOL pop ups?

link up a way to access files (pdf)

mileage - user by day for tax

way to see how much of a retainer has been paid(hide from all but admin)

keep track of tolling of expenses by case.(by receipts with scans)

billing entries - i.e. 5min phone_cool...1.5 hours appearsence ect ect?

Think about css?(edit responsive css as well) => fine for now, but would need polishing for production.


add search for cases(index and caption) and clients(someday)
add fee schedule calc(someday)

templates



Presentation:

As new user

- show sign up process
  - explain the idea that this is only for employees so you must be approved (show code for this? db line(:approved) method in user model(active_for_authenication)
  - Omni Auth(show rigging in user model) also explain why you wouldn't use this in this domain.

As a regular user
  -show case lists
  -show case show pages
  -show notes
  -make a note as bernie for admin to delete
  -show clients show page
  -show nested routes
  -show forms for new
  -show some stuff you can't do unless a admin

As admin
  -show approval process
  -show "deleteing" users (how you just make them unapproved again so you don't lose notes by that user.)
  -show that admin can delete anyone's notes.
