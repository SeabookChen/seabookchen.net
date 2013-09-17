require 'selenium-webdriver'

case ENV['browser']
	when 'chrome', 'Chrome'
		driver = Selenium::WebDriver.for :chrome

	when 'ff', 'Firefox'
		driver = Selenium::WebDriver.for :firefox

	when 'debug'
		profile = Selenium::WebDriver::Firefox::Profile.new
		Dir.glob('features/support/bin/*.xpi') do |extension_file|
				puts "Loading Firefox extension '#{extension_file}'"
				profile.add_extension(extension_file)
		end

		driver = Selenium::WebDriver.for :firefox, :profile => profile

	else
		driver = Selenium::WebDriver.for :phantomjs
end

Before do
	@driver = driver
end

at_exit do
	if ENV['browser'] != 'debug'
		driver.quit
	end
end

# navigation
SITE_URL = 'http://localhost:4000'
NAV_LINKS = %w[Articles Notes Categories Tags]

# window
WINDOW_HEIGHT = 1080