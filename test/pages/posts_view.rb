require './test/pages/base_page.rb'

module Pages
    class PostsView < BasePage

        def post_lists
            return body_content.find_elements(:css => '.post-list')
        end

        def posts
            return body_content.find_elements(:css => '.posts')
        end
    end
end