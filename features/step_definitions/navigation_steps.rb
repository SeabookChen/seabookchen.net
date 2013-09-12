Given(/^I am on the homepage$/) do
	@driver.navigate.to(BASE_URL)
end

Then(/^I should see page title "(.*?)"$/) do |title|
	assert_equal(title, @driver.title)
end

Then(/^I should see page url "(.*?)"$/) do |url|
	assert_equal(url, @driver.current_url)
end