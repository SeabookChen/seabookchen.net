require './features/support/pages/base_page.rb'

module Pages
	class ListView < BasePage

		def post_list
			return body_content.find_elements(:css => '.post-list')
		end

		def posts
			return body_content.find_elements(:css => '.posts')
		end
	end
end