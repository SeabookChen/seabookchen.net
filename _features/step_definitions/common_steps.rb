Given(/^I visit "(home|articles|notes|categories|tags|about)" page$/) do |page_name|
	url = SITE_URL
	case page_name
		when 'home'
			url += '/'
			@page = Pages::HomePage.new(@driver)
		when 'articles'
			url += '/articles'
		when 'notes'
			url += '/notes'
		when 'categories'
			url += '/categories'
		when 'tags'
			url += '/tags'
		when 'about'
			url += '/about'
	end
	@driver.navigate.to(url)
end

Given(/^I set window width to (\d+)px$/) do |window_width|
	@driver.manage.window.resize_to(window_width, WINDOW_HEIGHT)
end

When(/^I click navigation link text "(.*?)"$/) do |link_text|
	@driver.find_element(:xpath, ".//a[text()='#{link_text}']").click
end

When(/^I click social icon with title "(.*?)"$/) do |title|
	@page.footer.find_social_link(title).click
end

When(/^I refresh the page$/) do
	@driver.navigate.refresh
end

Then(/^I should see page title "(.*?)"$/) do |title|
	assert_equal(title, @driver.title)
end

Then(/^I should see homepage url$/) do
	assert_equal(SITE_URL + '/', @driver.current_url)
end

Then(/^I should see page url "(.*?)" \(with slashes\)$/) do |url|
	assert_equal(SITE_URL + url, @driver.current_url)
end

Then(/^I should have a browser window opened which contains partial url "(.*?)"$/) do |partial_url|
	assert_equal(true, is_window_present(partial_url))
end
