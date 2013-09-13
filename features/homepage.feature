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

	Scenario Outline: Header logo link should be loaded
		When I set window width to <width>px
		Then I should see header logo link loaded

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1080  |
			| 1920  |

	Scenario Outline: Header navigation links shouldn't be displayed when width < 420px
		When I set window width to <width>px
		Then I should have header navigation links
		And I should "<see?>" header navigation links

		Examples:
			| width | see?    |
			| 240   | not see |
			| 320   | not see |
			| 640   | see     |
			| 768   | see     |
			| 1080  | see     |
			| 1920  | see     |

	Scenario Outline: Footer social icons should be in different sizes depending on window width
		When I set window width to <width>px
		Then I should see footer social icons in <size>px square
		And I should see footer social icon links loaded

		Examples:
			| width | size |
			| 240   | 34   |
			| 320   | 42   |
			| 640   | 48   |
			| 768   | 48   |
			| 1080  | 48   |
			| 1920  | 48   |

	Scenario Outline: Footer 'about' link should be loaded
		When I set window width to <width>px
		Then I should see footer 'about' link loaded

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1080  |
			| 1920  |

