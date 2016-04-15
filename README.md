# legal-aid
A web app for law firms built with Ruby on Rails

Plan of attack:

Setup Devise
Setup Pundit
Validations?
Validation errors displayed on view(see requirements)
Deal with nested routes for users and cases
On case page list assigned users(lawyers and paras)
Think about css?


modify/create forms for creating cases needs to assign attorney and have the abilty to create a new attorney if the one you want assigned doesnt already exhist(this is where you should use a join model! and nested form)

also need a form to assign a user to a case(only admin)
make forms for notes

the join models here arent great for the nest form...think maybe...courthouse_id | case_id

courthouse attr civil or supreme, address, ??



Roadmap:

NEED to add and set up pundit for roles and scopes. [user, attorney, admin]

clients/:id/cases/:id
  #the lawyer routes should only be accessable to the lawyer being identified and to the admins

  cases have_many "notes"(which is like comments on a blog post)
  notes belong to a case

  any user can leave a note
  only the owner of the note may edit it
  owners and admins can delete notes

  a user has_many notes
  notes belong to a user
  cases have many notes
  note belongs to a case

  note_table => 

  note_id(primary) user_id case_id note_content

  a case has_many users, through case_users
  a user has many cases, through case_users

  case_users case_id:integer user_id:integer

<!--   a client has many cases
  cases belong to a client -->
  a lawyer has many clients through cases <!-- this might need to be a user, where you use the roles for access to lawyers -->

  the nested form can be used to set up a new case where the nested resource is the the client

  lawyer crud (only admin may delete)
  case crud (only admins may delete, only users assigned to the case can edit)