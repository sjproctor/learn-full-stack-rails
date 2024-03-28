# Rails Full-stack 3/27/2024

### Purpose

This application was crafted for an instructional demo of full-stack Rails. The goal was to explore RESTful routes and understand data flow in the MVC architecture.

The notes below describe the step-by-step build process so the students could model the workflow.

### App Configurations and Setup

- added RSpec gem
- generated model: `rails g model Herb name:string watered:string`
- ran the migration
- added a few herbs directly in the Rails console
- generated controller: `rails g controller Herb`

### RESTful Routes

### Index

- controller - active record query for all the herbs
- route - get request, added alias, and root to index
- view - iterated over the active record array to display herb names
- notes - erbs tags with `=` display content to the browser, no equal sign don't display

### Show

- controller - active record query to find one herb by params
- route - get request, added alias, required param of id `Parameters: {"id"=>"2"}`
- view - parsed into the herb and displayed name and watered values
- link from show to index
- link from index to show requires a param

```ruby
<%= herb.name %>
<%= link_to herb.name %>
<%= link_to herb.name, herb_path(herb) %>
```

### New

- controller - active record connection to the herb model
- route - get request, added alias, reorder the routes because new is more specific than show
- view - form_with helper to create a form with text input and radio buttons
- link from index to new
- link from new to index

### Create

- controller - active record query to create, added strong params method that limits what the user has access to in the database
- route - post request
- view - no inherent view with post, added submit button to the form and redirect on successful creation of herb

### Edit

- controller - active record query to find one herb by params
- route - get request, added an alias, required param for edit
- view - c/p from the new form, minor text changes
- link from edit to index
- link from show to edit that specific herb

### Update

- controller - active record query to find one herb by params, called strong params method
- route - patch request, require a param for update
- view - redirect to the show page if the update is valid

### Destroy

- controller - active record query to find one herb by params, called the destroy method, redirect to index after deleting
- route - delete request, require a param for destroy, added alias to use on the link
- view - added a link on the show page and called the alias with the data to specify a delete action
