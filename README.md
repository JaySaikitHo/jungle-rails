# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. This was a good chance to practice the MVC model and use Active Records with has_secure_password. The original project was a skeleton and we added user login/registration, category listings, an admin dashboard and basic admin authentication. There were also a currency display bug for us to fix and UI improvements such as order details and adding a sold out icon.

 We had a chance to try out the Stripe API to simulate purchases. We used Rspec for model testing. We also implemented unit testing and feature testing with capybara and phantomjs for a headless web driver.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
