# legal-aid
A web app for law firms built with Ruby on Rails


for Jquery assessment:


The rails API must reveal at least one has-many relationship in the 
JSON that is then rendered to the page:

list clients cases on button click on right of show page


Must use your Rails api to create a resource 
and render the response without a page refresh:

this is just an ajax post request to make a new note then add it to the list



someday:


keep track of tolling of expenses by case.(by receipts with scans)

way to see how much of a retainer has been paid(hide from all but admin)
this just might need to be a link for each case that only admins can click to access

billing entries - i.e. 5min phone_call...1.5 hours appearsence ect ect?

billing could be revealed by jquery on the cases show page. 
then if you wanted to see more than just the totals(by month?)...
you could use the api to render the billing details.

use bootstrap to fix columns?(will this over write my current css?)

owners and admins can delete notes => 
this is working but not with the authorize @record method. 
not sure why?


maybe: 

automatic file number gen

SOL pop ups?

link up a way to access files (pdfs)

way to see how much of a retainer has been paid(hide from all but admin)

mileage - user by day for tax

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

