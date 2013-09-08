require 'selenium-webdriver'
require './test/pages/home_page.rb'

module Base
    module_function

    def start_driver(window_width, window_height)
        driver = Selenium::WebDriver.for :phantomjs
        driver.manage.window.resize_to(window_width, window_height)
        return driver
    end

    def open_home_page(driver)
        home_page = Pages::HomePage.new(driver)
        home_page.navigate_to()
        return home_page
    end
end
