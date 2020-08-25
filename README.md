# Hatched!

A Ruby on Rails 6 project that will help people find mentors to schedule and facilitate mentoring sessions.

## Technologies used

- Ruby on Rails 6.0.3 :)
- PostgreSQL
- RSpec
- Devise
- [View Components](https://github.com/github/view_component)
- [StimulusJS](https://stimulusjs.org/)
- [StimulusReflex](https://docs.stimulusreflex.com/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Heroicons](https://heroicons.dev/)


## Status

I am just getting started! User registration, login, password reset, profile, and admin interfaces are all that exist so far.

## Installation

There are two ways you can run this application.

* **Directly on your laptop or desktop computer** - _If you choose this method you will need to have a Ruby on Rails environment setup and a Postgres database running on your computer._

* **Using Docker and Docker Compose to install everything requried in a container** - _If you choose this option you will need to have Docker and Docker Compose installed on your computer._

### Both methods

Clone this project

### **Running directly on your computer**

> This is by no means a comprehensive installation guide but it should get you going in the right direction.

1. Install Ruby and Rails 6

Follow the [guide on rubyonrails.org](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails)

2. If it's not already installed install Postgres by following [the guide on posgresql.org](https://www.postgresql.org/download/) 

3. In a terminal window at the root project directory run the following commands:

`rake db:create`  
`rake db:migrate`  
`rake db:seed`

4. Start the rails server with:

`rails s -p 3000`

### **Running in a Docker container**

> This is by no means a comprehensive installation guide but it should get you going in the right direction.

1. Install Docker by following the [guides at docker.com](https://docs.docker.com/get-docker/)

2. Install Docker Compose - If you are running on Windows or MacOS Docker Compose is installed with Docker. If you are running Linux you can follow the [guide on this page.](https://docs.docker.com/compose/install/)

3. Start the container using Docker Compose by executing the following in a terminal window at the root project directory. It will take a while to build the container.

`docker-compose up`  

4. Open a shell in the container by typing the following in a terminal window at the root of the project

`docker-compose exec app /bin/bash`  

5. In the container shell terminal create the database using the commands

`rake db:create`  
`rake db:migrate`  
`rake db:seed`  

## The DB Schema so far

![DB Diagram](https://oc-resources.s3-us-west-2.amazonaws.com/images/hatched_db.png)