require 'test/unit'
require './test/base.rb'
require './test/common_modules.rb'
require './test/test_home_page/common_modules.rb'

module TestHomePage
    class TestWidth1920px < Test::Unit::TestCase
        include Base::TearDown

        include Base::TestCommonModules
        include Base::TestWidthGreaterThan420px

        include TestHomePage::TestCommonModules
        include TestHomePage::TestWidthGreaterThan590px

        def setup
            @driver = Base::start_driver(1920, 1080)
            @current_page = Base::open_home_page(@driver)
        end
    end
end
