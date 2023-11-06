Feature: Navigate to plagiarism policy and Navigate to Diploma in IT page

	Scenario: Open Plagiarism Policy Page
		Given Chrome browser is launched
		When Open NP Website
		Then Maximize Window
		Then Hover over Student Life navbar item
		Then Click on Code of Conduct link
		Then Open plagiarism policy
		Then Check if plagiarism policy has been opened in new tab
		And Close browser