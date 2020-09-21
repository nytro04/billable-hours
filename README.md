# BILLABlE HOURS

## Brief Overview
        ```Four(4) tables were created to record data.

        1. Users/Employees Table - contain information relating to employees of the said companies.

        2. Companies Table - contain information pertaining to companies/clients the firm renders service(s) to.

        3. Billable Hours Table - contain a lawyer's timesheet.
        4. Roles Table - contain roles in the law firm.

        - A role is assigned to a user/employee when created

        - Only users/employees with finace roles are permitted to generate invoices.

        - In a bid to secure the system against unauthorized users, JSON Web Tokens are used to authenticate users and every request made to the system.```

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