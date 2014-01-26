Feature: Test homepage footer

	Background:
		Given I visit "home" page

	Scenario Outline: Footer's 'about' link should be clickable
		When I set window width to <width>px
		Then I should have clickable footer's 'about' link

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Footer's social icons should be in different sizes depending on window width
		When I set window width to <width>px
		Then I should see footer's social icons in <size>px square

		Examples:
			| width | size |
			| 240   | 28   |
			| 320   | 42   |
			| 640   | 48   |
			| 768   | 48   |
			| 1280  | 48   |
			| 1920  | 48   |

	Scenario Outline: Footer's social icons should be clickable in all window widths
		When I set window width to <width>px
		Then I should have clickable footer's social icon links

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Footer's social icons should be working as intended
		When I click social icon with title "<icon_title>"
		Then I should have a browser window opened which contains partial url "<social_site_url>"

		Examples:
			| icon_title     | social_site_url                 |
			| Email          | scr.im/yizengdev                |
			| LinkedIn       | nz.linkedin.com/in/yizengnz     |
			| RSS            | rss.xml                         |
			| GitHub         | github.com/yizeng               |
			| Stackoverflow  | stackoverflow.com/users/1177636 |