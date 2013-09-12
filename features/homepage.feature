Feature: Load homepage

	Background:
		Given I am on the homepage

	Scenario Outline: Check page title
		When I set window width to <width>px
		Then I should see page title "Yi Zeng"

		Examples:
			| width |
			|  320  |
			|  640  |
			|  768  |
			|  1080 |
			|  1920 |

	Scenario Outline: Check page url
		When I set window width to <width>px
		Then I should see page url "http://yizeng.me/"

		Examples:
			| width |
			|  320  |
			|  640  |
			|  768  |
			|  1080 |
			|  1920 |