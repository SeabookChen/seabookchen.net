require './test/pages/footer.rb'
require './test/pages/header.rb'

module Pages
    class BasePage

        SITE_TITLE = 'Yi Zeng'
        SITE_URL = 'http://yizeng.me'
        ALL_HEADER_LINKS = %w[articles notes categories tags]

        attr_reader :page_title
        attr_reader :page_url

        def initialize(driver, page_name)
            @driver = driver

            @page_title = page_name.empty? ? "#{SITE_TITLE}" : "#{page_name} - #{SITE_TITLE}"
            @page_url = page_name.empty? ? "#{SITE_URL}/" : "#{SITE_URL}/#{page_name}/"
        end

        def navigate_to()
            @driver.navigate.to(@page_url)
        end

        def header
            return Pages::Header.new(@driver)
        end

        def body_content
            return @driver.find_element(:css => '.body .content')
        end

        def title_header
            return body_content.find_element(:css => 'header h1')
        end

        def footer
            return Pages::Footer.new(@driver)
        end
    end
end