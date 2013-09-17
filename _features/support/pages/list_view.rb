require './_features/support/pages/base_page.rb'

module Pages
	class ListView < BasePage

		def post_lists
			return body_content.find_elements(:class => 'post-list')
		end

		def posts
			return body_content.find_elements(:class => 'posts')
		end
	end
end