Feature: Open plagiarism policy and Navigate to Diploma in IT page

	Background:
		Given Chrome browser is launched
		When Open NP Website
		Then Maximize Window

	Scenario: Open Plagiarism Policy Page
		Then Hover over Student Life navbar item
		Then Click on Code of Conduct link
		Then Open plagiarism policy
		Then Check if plagiarism policy has been opened in new tab
		And Close browser

	Scenario: Navigate to Diploma in IT page
		Then Click on search icon
		Then Input search text and search
		Then Verify if new window with searches appeared
		Then Click on diploma link
		Then Verify is new window is diploma in IT page
		And Close Browser
		