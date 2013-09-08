require 'test/unit'
require './test/base.rb'
require './test/common_modules.rb'
require './test/pages/articles_page.rb'

module TestArticlesPage
    class TestWidth1024px < Test::Unit::TestCase
        include Base::TearDown

        include Base::TestCommonModules
        include Base::TestWidthGreaterThan420px

        def setup
            @driver = Base::start_driver(1024, 768)

            home_page = Base::open_home_page(@driver)
            home_page.header.nav_links[0].click()
            @current_page = Pages::ArticlesPage.new(@driver)
        end
    end
end