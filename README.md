# legal-aid
A web app for law firms built with Ruby on Rails

todo:

use bootstrap to fix columns?(will this over write my current css)

owners and admins can delete notes => this is working but not with the authorize @record method. not sure why?


maybe: 

automatic file number gen

SOL pop ups?

link up a way to access files (pdf)

way to see how much of a retainer has been paid(hide from all but admin)

keep track of tolling of expenses by case.(by receipts with scans)

billing entries - i.e. 5min phone_call...1.5 hours appearsence ect ect?

Think about css?(edit responsive css as well) => fine for now, but would need polishing for production. Make errors smaller. maybe use a bootstrap setup for columns

add search for cases(index and caption) and clients(someday)
add fee schedule calc(someday)

templates


for jquery assessment

REQUIREMENTS
Must render one show page and one index page via jQuery and an Active Model Serialization JSON Backend.

Must use your Rails api to create a resource and render the response without a page refresh.

The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page.

Must have at least one link that loads, or updates a resource without reloading the page - NOTES!

Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype. Formatters work really well for this.



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
  -show forms for new (client, case)
  -make a new case with a new client
  -show some stuff you can't do unless a admin - edit case not assign to

As admin
  -show approval process
  -show "deleteing" users (how you just make them unapproved again so you don't lose notes by that user.)
  -show that admin can delete anyone's notes.
