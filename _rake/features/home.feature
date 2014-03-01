Feature: Test home page

	Background:
		Given I visit "home" page

	Scenario Outline: Page title and url should be correct
		When I set window width to <width>px
		Then I should see page title "Yi Zeng"
		And I should see page url "/" (with slashes)

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Navigation circles should be visible depending on width
		When I set window width to <width>px
		Then I wait for bio page to be loaded
		And I should <have?> clickable navigation circles
		And I click continue button
		And I should <have?> clickable navigation circles

		Examples:
			| width | have?    |
			| 240   | not have |
			| 320   | not have |
			| 640   | not have |
			| 768   | have     |
			| 1280  | have     |
			| 1920  | have     |

	Scenario Outline: Navigating between pages should work properly
		When I set window width to <width>px
		Then I wait for bio page to be loaded
		And I should see bio page loaded
		And I should not see social page loaded
		When I click continue button
		And I wait for social page to be loaded
		Then I should see social page loaded
		And I should not see bio page loaded

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |
