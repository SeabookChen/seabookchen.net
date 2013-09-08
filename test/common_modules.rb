module Base
    module TearDown
        def teardown
            @driver.quit
        end
    end

    module TestCommonModules
        def test_header_logo_link_loaded
            assert_equal(Pages::BasePage::SITE_TITLE.downcase, @current_page.header.logo_link.text)

            assert_equal(true, @current_page.header.logo_link.displayed?)
            assert_equal(true, @current_page.header.logo_link.enabled?)
        end

        def test_body_content_loaded
            assert_equal(true, @current_page.body_content.displayed?)
            assert_equal(false, @current_page.body_content.text.empty?)

            assert_equal(true, @current_page.title_header.displayed?)
            assert_equal(false, @current_page.title_header.text.empty?)
        end

        def test_post__list_links_loaded
            @current_page.posts.each do |post|
                link = post.find_element(:css => 'a')
                assert_equal(true, link.displayed?)
                assert_equal(true, link.enabled?)
                assert_equal(false, link.text.empty?)
                assert_equal(false, link.attribute('href').nil?)
                assert_equal(false, link.attribute('href').empty?)
            end
        end

        def test_footer_about_link_loaded
            assert_equal(true, @current_page.footer.about_link.displayed?)
            assert_equal(true, @current_page.footer.about_link.enabled?)
        end

        def test_footer_social_links_loaded
            @current_page.footer.social_links.each do |link|
                assert_equal(true, link.enabled?)
            end
            @current_page.footer.social_images.each do |img|
                assert_equal(true, img.displayed?)
                assert_equal(img.size.width, img.size.height)
            end
        end
    end

    module TestWidthSmallerThan420px
        def test_header_nav_links_not_displayed
            all_header_links = Pages::BasePage::ALL_HEADER_LINKS

            assert_equal(all_header_links.count, @current_page.header.nav_links.count)
            @current_page.header.nav_links.each do |link|
                assert_equal(false, link.displayed?)
                assert_equal(true, link.text.empty?)
            end
        end
    end

    module TestWidthGreaterThan420px
        def test_header_nav_links_loaded
            all_header_links = Pages::BasePage::ALL_HEADER_LINKS

            assert_equal(all_header_links.count, @current_page.header.nav_links.count)
            @current_page.header.nav_links.each do |link|
                assert_equal(true, link.displayed?)
                assert_equal(true, link.enabled?)
                assert_equal(true, all_header_links.include?(link.text))
                assert_equal(true, link.attribute('href').end_with?(link.text))
            end
        end
    end
end