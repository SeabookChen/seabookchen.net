module Pages
	class Header

		def initialize(driver)
			@header = driver.find_element(:css => '#page > header')
		end

		def logo_link
			@header.find_element(:css => '.logo > a')
		end

		def nav_links
			@header.find_elements(:css => ':not(.logo) > a:not(.btn-search)')
		end
	end
end