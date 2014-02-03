Then(/^I should have search overlay opened$/) do
	assert_equal(true, is_element_clickable(@page.search_overlay.element))
end