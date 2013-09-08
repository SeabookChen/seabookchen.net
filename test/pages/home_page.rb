require './test/pages/posts_view.rb'

module Pages
    class HomePage < PostsView

        def initialize(driver)
            super(driver, '')
        end

        def category_headers
            return body_content.find_elements(:css => '.category')
        end
    end
end