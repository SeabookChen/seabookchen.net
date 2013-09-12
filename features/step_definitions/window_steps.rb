Given(/^I set window width to (\d+)px$/) do |window_width|
	@driver.manage.window.resize_to(window_width, WINDOW_HEIGHT)
end