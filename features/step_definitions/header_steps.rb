Then(/^I should have header navigation links$/) do
	@page.header.nav_links.each do |link|
		assert_equal(true, NAV_LINKS.include?(link.attribute('textContent')))
	end
	assert_equal(NAV_LINKS.count, @page.header.nav_links.count)
end

Then(/^I should "(not see|see)" header navigation links$/) do |target|
	case target
		when 'not see'
			@page.header.nav_links.each do |link|
				assert_equal(false, link.displayed?)
				assert_equal(true, link.text.empty?)
			end
		when 'see'
			@page.header.nav_links.each do |link|
				assert_equal(false, link.text.empty?)

				assert_equal(true, link.displayed?)
				assert_equal(true, link.enabled?)
				assert_equal(true, link.attribute('href').end_with?(link.text))
			end
	end
end

Then(/^I should see header logo link loaded$/) do
	assert_equal(SITE_TITLE.downcase, @page.header.logo_link.text)

	assert_equal(true, @page.header.logo_link.displayed?)
	assert_equal(true, @page.header.logo_link.enabled?)
end
