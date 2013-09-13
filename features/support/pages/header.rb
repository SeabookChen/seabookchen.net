module Pages
	class Header

		def initialize(driver)
			@header = driver.find_element(:css => '#page > header')
		end

		def logo_link
			@header.find_element(:css => '.logo > a')
		end

		def nav_links
			@header.find_elements(:css => 'li:not(.logo) > a')
		end
	end
end