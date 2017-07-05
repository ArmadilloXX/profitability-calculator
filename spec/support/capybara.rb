require 'capybara/rspec'
require 'selenium-webdriver'

chrome_options = {
  browser: :chrome,
  options: ::Selenium::WebDriver::Chrome::Options.new
}
# chrome_options[:options].add_argument("--window-size=1280,1024")
# chrome_options[:options].add_argument("--headless")

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, chrome_options)
end

Capybara.configure do |config|
  config.javascript_driver = :selenium_chrome
  config.app_host = 'http://eventarium.dev'
  config.always_include_port = true
end
