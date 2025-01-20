# frozen_string_literal: true

require 'capybara/rspec'
require 'capybara-screenshot/rspec'

class CapybaraInitializer
  def call
    Capybara::Screenshot.autosave_on_failure = true
    Capybara.server = :puma
    # Capybara.default_driver = :selenium_chrome_headless
    Capybara.register_driver :selenium_chrome_headless do |app|
      options = ::Selenium::WebDriver::Options.chrome(browser_version: 'stable')
      options.unhandled_prompt_behavior = :ignore
      options.args << '--headless=new'
      options.args << '--no-sandbox'
      options.args << '--disable-dev-shm-usage'
      options.args << '--disable-extensions'
      options.args << '--disable-gpu'
      options.args << '--disable-infobars'
      options.args << '--disable-smooth-scrolling'
      options.args << '--window-size=1920,1080'
      Capybara::Selenium::Driver.new(app, browser: :chrome, options:)
    end

    Capybara.javascript_driver = :selenium_chrome_headless
    Capybara.current_driver = :selenium_chrome_headless

    Capybara::Screenshot.register_driver(:selenium_chrome_headless) do |driver, path|
      driver.browser.save_screenshot(path)
    end
  end
end
