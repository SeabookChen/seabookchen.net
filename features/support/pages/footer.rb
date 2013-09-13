module Pages
	class Footer

		def initialize(driver)
			@footer = driver.find_element(:css => '#page > footer')
		end

		def about_link
			@footer.find_element(:css => 'h4')
		end

		def social_links
			@footer.find_elements(:css => ".social-iconsa > a")
		end

		def social_images
			@footer.find_elements(:css => ".social-iconsa > a > img")
		end
	end
end