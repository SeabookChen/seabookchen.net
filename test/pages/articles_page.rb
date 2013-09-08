require './test/pages/posts_view.rb'

module Pages
    class ArticlesPage < PostsView

        def initialize(driver)
            super(driver, 'articles')
        end
    end
end