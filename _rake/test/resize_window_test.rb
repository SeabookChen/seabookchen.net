require 'selenium-webdriver'
require 'test/unit'

module Test
	class ResizeWindowTests < Test::Unit::TestCase

		NEW_WIDTH = 1920
		NEW_HEIGHT = 1080

		def setup
			@driver = Selenium::WebDriver.for :firefox
		end

		def teardown
			@driver.quit
		end

		def test_setting_window_using_dimension
			target_size = Selenium::WebDriver::Dimension.new(NEW_WIDTH, NEW_HEIGHT)
			@driver.manage.window.size = target_size

			assert_equal(NEW_WIDTH, @driver.manage.window.size.width)
			assert_equal(NEW_HEIGHT, @driver.manage.window.size.height)
		end

		def test_resizing_window
			@driver.manage.window.resize_to(NEW_WIDTH, NEW_HEIGHT)

			assert_equal(NEW_WIDTH, @driver.manage.window.size.width)
			assert_equal(NEW_HEIGHT, @driver.manage.window.size.height)
		end
	end
end