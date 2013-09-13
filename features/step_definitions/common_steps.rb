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

Then(/^I should see page title "(.*?)"$/) do |title|
	assert_equal(title, @driver.title)
end

Then(/^I should see page url "(.*?)"$/) do |url|
	assert_equal(url, @driver.current_url)
end