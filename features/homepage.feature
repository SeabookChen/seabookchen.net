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
			| 1080  |
			| 1920  |

	Scenario Outline: Page url should be correct
		When I set window width to <width>px
		Then I should see page url "http://yizeng.me/"

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1080  |
			| 1920  |

	Scenario Outline: Header's logo link should be loaded
		When I set window width to <width>px
		Then I should have clickable header's logo link
		And I should see that header's logo link has text "yi zeng"

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1080  |
			| 1920  |

	Scenario Outline: Header's navigation links shouldn't be displayed when width < 420px
		When I set window width to <width>px
		Then I should have header's navigation links presented
		And I should "<see?>" header's navigation links

		Examples:
			| width | see?    |
			| 240   | not see |
			| 320   | not see |
			| 640   | see     |
			| 768   | see     |
			| 1080  | see     |
			| 1920  | see     |

	Scenario Outline: Footer's social icons should be in different sizes depending on window width
		When I set window width to <width>px
		Then I should see footer's social icons in <size>px square
		And I should have clickable footer's social icon links

		Examples:
			| width | size |
			| 240   | 34   |
			| 320   | 42   |
			| 640   | 48   |
			| 768   | 48   |
			| 1080  | 48   |
			| 1920  | 48   |

	Scenario Outline: Footer's 'about' link should be clickable
		When I set window width to <width>px
		Then I should have clickable footer's 'about' link

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1080  |
			| 1920  |

	Scenario Outline: Body's title header should be displayed
		When I set window width to <width>px
		Then I should see title header "All Posts"

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1080  |
			| 1920  |

	Scenario Outline: Body should list all posts
		When I set window width to <width>px
		Then I should have posts grouped by "articles, notes, random"
		And I should have clickable post links

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1080  |
			| 1920  |

	Scenario Outline: Body's post lists should show dates depending on window width
		When I set window width to <width>px
		Then I should "<see?>" date displayed for each post

		Examples:
			| width | see?    |
			| 240   | not see |
			| 320   | not see |
			| 640   | not see |
			| 768   | see     |
			| 1080  | see     |
			| 1920  | see     |