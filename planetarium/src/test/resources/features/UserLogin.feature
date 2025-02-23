@UserLogin
Feature: UserLogin

	@PLAN-TC-38 @JREQ-PLAN-10 @AIO-FOLDER-Automated/User_Login
	Scenario Outline: User Login: User's password is hidden when user logs in
	Test case to check if the user's password is not visible when the user logs into Plantarium (Error Guess testing).
		Given The user is on the login page "<Host>"
		When The user inputs username "<Username>"
		And The user inputs password "<Password>"
		And The user's password is not visible on the login input
		And The user clicks on the Login button
		Then The user should be "<Authenticated>" and user's password "<Password>" is not visible
		And The user should be "<Redirected>" to their home page

	Examples: 
		| Host           | Username | Password       | Authenticated     | Redirected     |
		| localhost:8080 | Batman   | I am the night | authenticated     | redirected     |
		| localhost:8080 | (empty)  | I am the night | not authenticated | not redirected |

	@PLAN-TC-39 @JREQ-PLAN-10 @AIO-FOLDER-Automated/User_Login
	Scenario Outline: User Login: Valid username and password validate user to home page
	Test case to check if valid username and its corresponding password allows a user to access to their home page on Plantarium (Equivalence Partitioning testing).
		Given The user is on the login page "<Host>"
		When The user inputs username "<Username>"
		And The user inputs password "<Password>"
		And The user clicks on the Login button
		Then The user should be "<Authenticated>"
		And The user should be "<Redirected>" to their home page

	Examples: 
		| Host           | Username | Password       | Authenticated     | Redirected     |
		| localhost:8080 | Batman   | I am the night | authenticated     | redirected     |
		| localhost:8080 | Batman   | Clown prince   | not authenticated | not redirected |
		| localhost:8080 | Joker    | I am the night | not authenticated | not redirected |
		| localhost:8080 | Joker    | Clown prince   | not authenticated | not redirected |

	@PLAN-TC-40 @JREQ-PLAN-10 @AIO-FOLDER-Automated/User_Login
	Scenario Outline: User Login: User can access their home page when previously logged in via session data
	Test case checking if user can access their home page if they have previously logged in via session data (Error Guess testing).
		Given The user is on the login page "<Host>"
		When The user inputs username "<Username>"
		And The user inputs password "<Password>"
		And The user clicks on the Login button
		And The user is "<Authenticated>"
		And The user is "<Redirected>" to their home page
		And The user opens a new window
		And The user goes to the home page "<Home Page>"
		Then The user should be "<On Home Page>" with "<Username>"

	Examples: 
		| Host           | Username | Password       | Authenticated     | Redirected     | Home Page                  | On Home Page         |
		| localhost:8080 | Batman   | I am the night | authenticated     | redirected     | localhost:8080/planetarium | on the home page     |
		| localhost:8080 | (empty)  | (empty)        | not authenticated | not redirected | localhost:8080/planetarium | not on the home page |