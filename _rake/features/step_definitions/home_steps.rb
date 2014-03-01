When(/^I click continue button$/) do
	@page.btn_continue.click
end

Then(/^I wait for (bio|social) page to be loaded$/) do |page|
	if page == 'bio'
		wait_til_clickable(@page.btn_continue)
		wait_til_clickable(@page.header_name)
	else
		wait_til_clickable(@page.btn_enter_blog)
	end
	
end

Then(/^I should (not have|have) clickable navigation circles$/) do |target|
	expected = target == 'have' ? true : false
	@page.navigation_circles.each do |link|
		assert_equal(expected, is_link_clickable(link))
	end
end

Then(/^I should (not see|see) bio page loaded$/) do |target|
	expected = target == 'not see' ? false: true

	assert_equal(expected, @page.header_name.displayed?)
	assert_equal(expected, @page.header_title.displayed?)
	assert_equal(expected, @page.header_location.displayed?)
end

Then(/^I should (not see|see) social page loaded$/) do |target|
	expected = target == 'not see' ? false: true

	assert_equal(expected, is_link_clickable(@page.btn_enter_blog))
	@page.social_links.each do |link|
		assert_equal(expected, is_link_clickable(link))
	end
end
