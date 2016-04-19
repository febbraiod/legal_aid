s# legal-aid
A web app for law firms built with Ruby on Rails

NEXT ORGANIZE THIS TODO LIST AFTER LUNCH!


user/1/cases
also add link to user page

Setup all Pundit permissions

users/id/caes
only available to user and admin
only user and admin should be able to see user show page as well


Think about css?(edit responsive css as well) => fine for now, but needs polishing for user.
add search for cases(index and caption) and clients(someday)


any user can leave a note
only the owner of the note may edit it
owners and admins can delete notes

maybe:
<!--   a client has many cases
  cases belong to a client -->
  a lawyer has many clients through cases <!-- this might need to be a user, where you use the roles for access to lawyers -->

  user delete (only admin may delete)
  case update and delete (only admins may delete, only users assigned to the case can edit)