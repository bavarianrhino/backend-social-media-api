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

  ### <b>Routes </b>
  - Navigate to the api in your [browser](http://localhost:3000/timeline/1)
  - GET /timeline/:id
```
{
  "email": "rjriesenberger@gmail.com",
  "name": "Ryan Riesenberger",
  "github_username": "bavarianrhino",
  "registered_at": "2017-09-22T12:13:05.000Z",
  "rating": 4.5,
  "github": [
    {
      "id": "12157136056",
      "type": "PushEvent"
    },
      "repo": {
        "id": 258866509,
        "name": "bavarianrhino/backend-social-media-api",
        "url": "https://api.github.com/repos/bavarianrhino/backend-social-media-api"
    },
      "commits": [
        {
          "message": "updated readme with initial project thoughts and boiler plate",
          "url": ....
        }
      ]
    }
  ],
  "logs": [
    {
      "type_of": "PushEvent",
      "description": "Pushed/Created PushEvent was made for bavarianrhino/backend-social-media-api with 1 commit(s) to bavarianrhino/backend-social-media-api.",
      "loggable_type": "Github Log",
      "loggable_id": 1,
      "posted_at": "2020-04-25T20:28:39.000Z",
      "created_at": "2020-04-28T00:56:45.796Z",
      "updated_at": "2020-04-28T00:56:45.796Z",
      "user_id": 1
    },
    {
      "type_of": "CreateEvent",
      "description": "Pushed/Created CreateEvent was made for bavarianrhino/backend-social-media-api with  commit(s) to bavarianrhino/backend-social-media-api.",
      "loggable_type": "Github Log",
      "loggable_id": 1,
      "posted_at": "2020-04-25T20:24:31.000Z",
      "created_at": "2020-04-28T00:56:45.801Z",
      "updated_at": "2020-04-28T00:56:45.801Z",
      "user_id": 1
    },
    {
      "type_of": "Comment",
      "description": "New Comment -  There's nothing quite like urinating in the open air.",
      "loggable_type": "Comment",
      "loggable_id": 10941,
      "posted_at": "2017-10-30T00:05:11.000Z",
      "created_at": "2020-04-28T00:59:17.609Z",
      "updated_at": "2020-04-28T00:59:17.609Z",
      "user_id": 1
    },
    {
      "type_of": "Post",
      "description": "New Post - Wow, Bob, wow.",
      "loggable_type": "Post",
      "loggable_id": 84,
      "posted_at": "2017-10-29T22:08:40.000Z",
      "created_at": "2020-04-28T00:56:48.675Z",
      "updated_at": "2020-04-28T00:56:48.675Z",
      "user_id": 1
    },
  ]
}
```

---

## Requirements
* [x] Users timeline shows when they create a post
* [x] Users timeline shows when they comment on a post
* [x] Users timeline shows when they surpass a 4 star rating
* [x] Users timeline shows if they have linked their GitHub profile
* [x] Users timeline shows when they create a new repository
* [x] Users timeline shows when they open a new pull request
* [x] Users timeline shows when they merge a pull request
* [x] Users timeline shows when they push commits to a branch

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