Feature: Test blog page

	Background:
		Given I visit "blog" page

	Scenario Outline: Page title should be correct
		When I set window width to <width>px
		Then I should see page title "Blog - Yi Zeng"

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Page url should be correct
		When I set window width to <width>px
		Then I should see blog page url

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |
