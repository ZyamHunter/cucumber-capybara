require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    #:SELENIUM OU :SELENIUM_CHROME OU :SELENIUM_CHROME_HEADLESS
    config.app_host = 'https://ibk.stg.bankeiro.inovanti.com.br'
    config.default_max_wait_time = 30
end
