module Pages
	class SearchOverlay

		def initialize(driver)
			@overlay = driver.find_element(:class => 'search-wrapper')
		end

		def element
			@overlay
		end

		def input
			@overlay.find_element(:class => 'search-field')
		end

		def btn_close
			@overlay.find_element(:class => 'btn-close')
		end

		def result_list
			@overlay.find_element(:class => 'results')
		end

		def results
			@overlay.find_elements(:class => 'results > li > a')
		end
	end
end