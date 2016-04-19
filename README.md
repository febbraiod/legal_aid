# legal-aid
A web app for law firms built with Ruby on Rails

NEXT ORGANIZE THIS TODO LIST AFTER LUNCH!


Setup all Pundit permissions

user delete (only admin may delete)

case update and delete (only admins may delete, only users assigned to the case can edit)

check css for case show page

owners and admins can delete notes => this is working but not with authorize @record. not sure why?

users/id/cases
only available to user and admin?(is this neccesary? why are we hiding this route?)

Think about css?(edit responsive css as well) => fine for now, but needs polishing for user.
add search for cases(index and caption) and clients(someday)
add fee schedule calc(someday)

maybe:
<!--   a client has many cases
  cases belong to a client -->
  a lawyer has many clients through cases
  Think about css?(edit responsive css as well) => fine for now, but needs polishing for production.
  add search for cases(index and caption) and clients(someday) <!-- this might need to be a user, where you use the roles for access to lawyers -->
