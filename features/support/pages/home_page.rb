require './features/support/pages/list_view.rb'

module Pages
	class HomePage < ListView

		def initialize(driver)
			super(driver)
		end

		def category_headers
			return body_content.find_elements(:css => '.category')
		end
	end
end