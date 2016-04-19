# legal-aid
A web app for law firms built with Ruby on Rails

NEXT ORGANIZE THIS TODO LIST AFTER LUNCH!


Setup all Pundit permissions

users/id/cases
only available to user and admin?(is this neccesary? why are we hiding this route?)

any user can leave a note
only the owner of the note may edit it
owners and admins can delete notes

user delete (only admin may delete)
case update and delete (only admins may delete, only users assigned to the case can edit)

Think about css?(edit responsive css as well) => fine for now, but needs polishing for user.
add search for cases(index and caption) and clients(someday)

maybe:
<!--   a client has many cases
  cases belong to a client -->
  a lawyer has many clients through cases
  Think about css?(edit responsive css as well) => fine for now, but needs polishing for production.
  add search for cases(index and caption) and clients(someday) <!-- this might need to be a user, where you use the roles for access to lawyers -->
