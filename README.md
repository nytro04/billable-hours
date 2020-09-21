# BILLABlE HOURS

## Brief Overview
        
1. Users/Employees Table - contain information relating to employees of the said companies.

2. Companies Table - contain information pertaining to companies/clients the firm renders service(s) to.

3. Billable Hours Table - contain a lawyer's timesheet.

4. Roles Table - contain roles in the law firm.

- A role is assigned to a user/employee when created

- Only users/employees with finace roles are permitted to generate invoices.

- In a bid to secure the system against unauthorized users, JSON Web Tokens are used to authenticate users and every request made to the system.

## Installation

1. Install Rails at the command prompt if you haven't yet:

        $ git clone https://github.com/silaslawer/billable-hours.git

2. Change directory to `billable-hours` 

        $ cd billable-hours


3. Install application dependencies:

        $ bundle install

4. Migrate generated tables:

        $ rails db:migrate

5. Perform action seeded data:

        $ rails db:seed

6. start the web server:

        $ rails s

    run tests:

        $ bundle exec rspec

## Endpoints

<pre><code>                        Prefix Verb   URI Pattern                                                                              Controller#Action
                            roles GET    /roles(.:format)                                                                         roles#index
                                  POST   /roles(.:format)                                                                         roles#create
                             role GET    /roles/:id(.:format)                                                                     roles#show
                                  PATCH  /roles/:id(.:format)                                                                     roles#update
                                  PUT    /roles/:id(.:format)                                                                     roles#update
                                  DELETE /roles/:id(.:format)                                                                     roles#destroy
                        companies GET    /companies(.:format)                                                                     companies#index
                                  POST   /companies(.:format)                                                                     companies#create
                          company GET    /companies/:id(.:format)                                                                 companies#show
                                  PATCH  /companies/:id(.:format)                                                                 companies#update
                                  PUT    /companies/:id(.:format)                                                                 companies#update
                                  DELETE /companies/:id(.:format)                                                                 companies#destroy
                   billable_hours GET    /billable_hours(.:format)                                                                billable_hours#index
                                  POST   /billable_hours(.:format)                                                                billable_hours#create
                    billable_hour GET    /billable_hours/:id(.:format)                                                            billable_hours#show
                                  PATCH  /billable_hours/:id(.:format)                                                            billable_hours#update
                                  PUT    /billable_hours/:id(.:format)                                                            billable_hours#update
                                  DELETE /billable_hours/:id(.:format)                                                            billable_hours#destroy
                       auth_login POST   /auth/login(.:format)                                                                    authentication#authenticate
                           signup POST   /signup(.:format)                                                                        users#create
                          invoice GET    /invoice(.:format)                                                                       billable_hours#invoice
</code></pre>