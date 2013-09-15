Then(/^I should have header's navigation links presented$/) do
	assert_equal(NAV_LINKS.count, @page.header.nav_links.count)

	@page.header.nav_links.each do |link|
		assert_equal(true, NAV_LINKS.include?(link.attribute('textContent')))
	end
end

Then(/^I should "(not see|see)" header's navigation links$/) do |target|
		if target == 'see'
			@page.header.nav_links.each do |link|
				assert_equal(false, link.text.empty?)

				assert_equal(true, link.displayed?)
				assert_equal(true, link.enabled?)
				assert_equal(true, link.attribute('href').end_with?(link.text))
			end
		end
		if target == 'not see'
			@page.header.nav_links.each do |link|
				assert_equal(false, link.displayed?)
				assert_equal(true, link.text.empty?)
			end
		end
end

Then(/^I should see that header's logo link has text "(.*?)"$/) do |logo_text|
	assert_equal(logo_text, @page.header.logo_link.text)
end

Then(/^I should have clickable header's logo link$/) do
	assert_equal(true, @page.header.logo_link.displayed?)
	assert_equal(true, @page.header.logo_link.enabled?)
end
