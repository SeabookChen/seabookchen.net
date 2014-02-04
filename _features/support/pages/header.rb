module Pages
	class Header

		def initialize(driver)
			@header = driver.find_element(:css => '#page > header')
		end

		def element
			@header
		end

		def logo_link
			@header.find_element(:css => '.logo > a')
		end

		def search_button_icon
			@header.find_element(:css => '.logo > .btn-search')
		end

		def nav_links
			@header.find_elements(:css => '.link > :not(.btn-search)')
		end

		def search_link
			@header.find_element(:css => '.link > .btn-search')
		end
	end
end