Feature: Test homepage

	Background:
		Given I visit "home" page

	Scenario Outline: Page title should be correct
		When I set window width to <width>px
		Then I should see page title "Yi Zeng"

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
		Then I should see homepage url

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |
