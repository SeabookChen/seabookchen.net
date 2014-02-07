Feature: Test homepage body

	Background:
		Given I visit "home" page

	Scenario Outline: Body's title header should be displayed
		When I set window width to <width>px
		Then I should see title header "All Posts"

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Body should list all posts
		When I set window width to <width>px
		Then I should have posts grouped by "2013, 2014"
		And I should have clickable post links

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Body's post lists should show dates depending on window width
		When I set window width to <width>px
		Then I should <see?> date displayed for each post

		Examples:
			| width | see?    |
			| 240   | not see |
			| 320   | not see |
			| 640   | not see |
			| 768   | not see |
			| 945   | see     |
			| 1200  | not see |
			| 1380  | see     |
			| 1440  | not see |
			| 1920  | see     |
