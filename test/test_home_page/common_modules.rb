module TestHomePage
    module TestCommonModules
        def test_home_page_title_and_url
            assert_equal(@current_page.page_title, @driver.title)
            assert_equal(@current_page.page_url, @driver.current_url)
        end

        def test_post_list_loaded
            category_count = @current_page.category_headers.count
            post_list_count = @current_page.post_lists.count

            assert_equal(true, category_count > 0)
            assert_equal(true, post_list_count > 0)
            assert_equal(category_count, post_list_count)

            @current_page.category_headers.each do |category|
                assert_equal(true, category.displayed?)
                assert_equal(false, category.text.empty?)
            end
        end
    end

    module TestWidthSmallerThan590px
        def test_post_list_loaded_without_dates
            @current_page.posts.each do |post|
                date = post.find_element(:css => 'span')
                assert_equal(false, date.displayed?)
                assert_equal(true, date.text.empty?)
            end
        end
    end

    module TestWidthGreaterThan590px
        def test_post_list_loaded_with_dates
            @current_page.posts.each do |post|
                date = post.find_element(:css => 'span')
                assert_equal(true, date.displayed?)
                assert_equal(false, date.text.empty?)
            end
        end
    end
end