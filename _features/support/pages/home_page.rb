require './_features/support/pages/list_view.rb'

module Pages
	class HomePage < ListView

		def initialize(driver)
			super(driver)
		end

		def list_headers
			return body_content.find_elements(:class => 'category')
		end
	end
end