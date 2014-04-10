require 'selenium-webdriver'
require 'test/unit'

module Test

	module DisableJavaScript

		class DisableJavaScriptTests < Test::Unit::TestCase

			def is_javascript_enabled?
				@driver.get('https://www.whatismybrowser.com/is-javascript-enabled')

				wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
				detection = wait.until { @driver.find_element(:css, '#javascript-detection') }
				return detection.text.strip
			end

			def test_disabling_javascript_in_firefox
				profile = Selenium::WebDriver::Firefox::Profile.new
				profile["javascript.enabled"] = false
				@driver = Selenium::WebDriver.for(:firefox, :profile => profile)

				assert_equal('No', is_javascript_enabled?)

				@driver.quit
			end

			def test_disabling_javascript_in_phantomjs
				omit("Disabling JavaScript in PhantomJS will stop browser from functioning.\nOmitting ")

				capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs("phantomjs.page.settings.javascriptEnabled" => "false")
				@driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => capabilities
				assert_equal('No', is_javascript_enabled?)

				@driver.quit
			end
		end
	end
end