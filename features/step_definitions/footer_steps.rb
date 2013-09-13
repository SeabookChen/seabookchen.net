Then(/^I should see footer 'about' link loaded$/) do
	assert_equal(true, @page.footer.about_link.displayed?)
	assert_equal(true, @page.footer.about_link.enabled?)
end

Then(/^I should see footer social icons in (\d+)px square$/) do |size|
	@page.footer.social_images.each do |img|
		assert_equal(true, img.displayed?)

		assert_equal(size.to_i, img.size.width)
		assert_equal(size.to_i, img.size.height)
	end
end

Then(/^I should see footer social icon links loaded$/) do
	@page.footer.social_links.each do |link|
		assert_equal(true, link.displayed?)
		assert_equal(true, link.enabled?)
	end
end