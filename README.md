## README - We Care

The setups steps expect following tools installed on the system.

- Git
- Ruby [2.7.3]
- Rails [6.1.4]

##### 1. Check out the repository

```bash
git clone git@github.com:joshsoftware/we_care.git
```

##### 2. Create database.yml file

Copy the sample database.yml.sample into database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000