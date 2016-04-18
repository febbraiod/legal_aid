s# legal-aid
A web app for law firms built with Ruby on Rails

Plan of attack:

Validations?(do i need more?)
On case page list assigned users(lawyers and paras)!!
Setup Pundit
Think about css?(edit responsive css as well)
use 'open' attribute to sort case lists
find a way to hide the sign_up option. make it so only admins can add users.
add search for cases(index and caption) and clients(someday)


Roadmap:

NEED to add and set up pundit for roles and scopes. [user, attorney, admin]


ned routes user/id/cases

  #the lawyer routes should only be accessable to the lawyer being identified and to the admins

  any user can leave a note
  only the owner of the note may edit it
  owners and admins can delete notes

<!--   a client has many cases
  cases belong to a client -->
  a lawyer has many clients through cases <!-- this might need to be a user, where you use the roles for access to lawyers -->

  lawyer crud (only admin may delete)
  case crud (only admins may delete, only users assigned to the case can edit)