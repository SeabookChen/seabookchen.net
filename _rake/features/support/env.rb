require 'selenium-webdriver'

# navigation
SITE_URL = 'http://localhost:4000'
NAV_LINKS = %w[Articles Notes Categories Tags]

# window
WINDOW_HEIGHT = 1080

# timeout
TIMEOUT = 3 # seconds

case ENV['browser']
	when 'chrome', 'Chrome', 'debug'
		driver = Selenium::WebDriver.for :chrome

	when 'ff', 'firefox', 'Firefox'
		driver = Selenium::WebDriver.for :firefox

	else
		driver = Selenium::WebDriver.for :phantomjs
end

Before do
	@driver = driver
	@driver.manage.timeouts.implicit_wait = TIMEOUT
end

at_exit do
	if ENV['browser'] != 'debug'
		driver.quit
	end
end

module Helper
	def is_element_clickable(element)
		return element.displayed? && element.enabled?
	end

	def is_link_clickable(link)
		has_href = link.attribute('href').nil? == false && link.attribute('href').empty? == false
		return is_element_clickable(link) && has_href
	end

	def is_window_present(partial_url)
		@driver.window_handles.each do |handle|
			@driver.switch_to.window(handle)
			if @driver.current_url.include?(partial_url)
				return true
			end
		end
		return false
	end
end

World(Helper)