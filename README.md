# Rails 7.2.2.1 with RSpec, Capybara and selenium webdriver example app.

This repository demonstrates initialization of the feature-testing using RSpec, Capybara, Selenium::Webdriver and headless chrome. 

Launching the app:

```bash
rails s
```

Launching the test:

```bash
rspec spec/features/root_page_spec.rb
```

Feature spec launches headless chrome browser and navigates to the root path to the welcome page.
