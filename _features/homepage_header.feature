Feature: Test homepage header

	Background:
		Given I visit "home" page

	Scenario Outline: Header's logo link should be loaded
		When I set window width to <width>px
		Then I should have clickable header's logo link
		And I should see that header's logo link has text "Yi Zeng"

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Header's navigation links shouldn't be displayed when width is less than 420px
		When I set window width to <width>px
		Then I should have header's navigation links presented
		And I should <see?> header's navigation links

		Examples:
			| width | see?    |
			| 240   | not see |
			| 320   | not see |
			| 640   | see     |
			| 768   | see     |
			| 1280  | see     |
			| 1920  | see     |

	Scenario Outline: Header's navigation links should be clickable when width is greater than 420px
		When I set window width to <width>px
		Then I should have clickable header's navigation links

		Examples:
			| width |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Header's navigation links should be working as intended
		When I click navigation link text "<link_text>"
		Then I should see page url "<page_url>" (with slashes)
		And I should see page title "<page_title>"
		And I should see title header "<title_header>"

		Examples:
			| link_text  | page_url     | page_title           | title_header |
			| Yi Zeng    | /            | Yi Zeng              | All Posts    |
			| Articles   | /articles/   | Articles - Yi Zeng   | Articles     |
			| Notes      | /notes/      | Notes - Yi Zeng      | Notes        |
			| Categories | /categories/ | Categories - Yi Zeng | Categories   |
			| Tags       | /tags/       | Tags - Yi Zeng       | Tags         |
			| About      | /about/      | About - Yi Zeng      | About        |
