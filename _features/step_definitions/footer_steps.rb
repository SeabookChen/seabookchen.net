Then(/^I should have clickable footer's 'about' link$/) do
	assert_equal(true, @page.footer.about_link.displayed?)
	assert_equal(true, @page.footer.about_link.enabled?)

	assert_equal(false, @page.footer.about_link.text.empty?)
	assert_equal(false, @page.footer.about_link.attribute('href').nil?)
	assert_equal(false, @page.footer.about_link.attribute('href').empty?)
end

Then(/^I should see footer's social icons in (\d+)px square$/) do |size|
	assert_equal(true, @page.footer.social_images.count > 0)

	@page.footer.social_images.each do |img|
		assert_equal(true, img.displayed?)

		assert_equal(size.to_i, img.size.width)
		assert_equal(size.to_i, img.size.height)
	end
end

Then(/^I should have clickable footer's social icon links$/) do
	assert_equal(true, @page.footer.social_links.count > 0)

	@page.footer.social_links.each do |link|
		assert_link_clickable(link)
	end
end