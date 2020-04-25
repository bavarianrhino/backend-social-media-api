# Backend Social Media API
---
>A social media web service API that RESTfully persists user data with a postgreSQL database via Active Record implementing various model relationships along with specified CRUD actions

>By [Ryan Riesenberger](mailto:rjriesenberger@gmail.com)

---
## 💻 Local Env Installation

### 🔨 <b>Installing the application</b>

- Navigate to [repo](https://github.com/bavarianrhino/backend-social-media-api)
```shell
    $ git clone git@github.com:bavarianrhino/backend-social-media-api.git
    $ cd backend-social-media-api
    $ bundle install
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
```
### 🔨 <b>Running the application</b>

- To serve the Ruby on Rails API navigate to the backend directory and execute command
```shell
    $ rails s
```
- Navigate to the api in your [browser](http://localhost:3000/)

---

## Requirements
* [ ] Items
* [ ] Items
* [ ] Items
* [ ] Items

---

## Initial thoughts on setting up project.

What are my models, their associations, and their attributes?
  - After viewing seed data, my models and attributes are largely given however, I 
    need to implement timeline and github data. Are these separate models or do I add more attributes to user and order all models by timestamps?
  - Something I noticed was under user seed data, only some github names are provided.

What are my routes and their operations?
  - Not a priority yet. I'll open up all routes for debugging and user boiler plate operations.
  
What are the technologies/gems/tools I need to use outside of a basic CRUD app?
  - After viewing csv seed data, I may need to hard code a few lines of seed data to set up initial models and get app working. Once completed, I plan on researching csv parsing tools.
  - I need to query github for data...use simple curl or use gem for api queries?
  - Need to research authentication gems as all users come with email. Assuming tokens need to be used as this api is mainly for mobile devices.
    - Use Tiddle?
  - Limiting items on timeline, use gem or use vanilla ruby?
    - Use Pagnate or will_pagnate?

---
## Execution Plan and overall direction
### MVP

Complete Functional Requirements and CRUD Operations

Parse CSV seed data 

Create Logs instances while seeding data.

Models : Attributes
- Users : 
- Posts :
- Comments:
- Ratings : 
- Logs : 

### MVP2

- Write Tests & Use Rspec
- Authentication

---