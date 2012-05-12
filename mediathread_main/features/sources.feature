Feature: Manage Sources

    Scenario: 1. View Source Media, Add Sources, Enable Upload 
        Using selenium
        Given I am logged in as test_instructor
        Given I am in the Sample Course class
        When I access the url "/"
        Then I am at the Home page
        
        When I click the Source Media button
        Then I am at the Source Media page
        Then there is a Source Media column
        Then there is help for the Source Media column
        Then I do not see "Upload Video"
        Then I see 0 sources
        
        When I click the Instructor Dashboard button
        Then I am at the Instructor Dashboard page
        
        When I click the Manage Sources button
        Then I am at the Manage Sources page
        
        # Enable Video Upload
        When I click the Enable Video Upload button
        Then I'm told "Mediathread Video Upload has been enabled for your class"
        Then I see "Upload Permission Settings"
        
        # Add the YouTube Source
        When I add YouTube to the class
        Then I'm told "You Tube has been enabled for your class"
        Then there is an Added button

        # Under Source Media        
        When I click the Source Media button
        Then I am at the Source Media page
        Then I see "Upload Video"
        Then I see 1 source
        
        Finished using Selenium
   
           
    Scenario: 2. Video Upload - Instructors Only
        Using selenium
        Given I am logged in as test_instructor
        Given I am in the Sample Course class
        Given video upload is enabled
        
        # By default, instructors and administrators are allowed to upload
        When I click the Source Media button
        Then I see "Upload Video"
        
        # Student cannot see
        When I log out
        When I type "test_student_one" for username
        When I type "test" for password
        When I click the Log In button
        Then I am at the Home page
        When I click the Source Media button
        Then I do not see "Upload Video"

        Finished using Selenium
        
    Scenario: 3. Video Upload - Administrators Only 
        Using selenium
        Given I am logged in as test_instructor
        Given I am in the Sample Course class
        Given video upload is enabled
        
        # Set for administrators
        When I click the Instructor Dashboard button
        When I click the Manage Sources button
        Then I am at the Manage Sources page
        When I allow Administrators to upload videos
        Then I'm told "Your changes have been saved"
        
        # Instructor cannot see
        When I click the Source Media button
        Then I do not see "Upload Video"
        
        # Student cannot see
        When I log out
        When I type "test_student_one" for username
        When I type "test" for password
        When I click the Log In button
        Then I am at the Home page
        When I click the Source Media button
        Then I do not see "Upload Video"
        
        Finished using Selenium
        
    Scenario: 4. Video Upload - Students Too 
        Using selenium
        Given I am logged in as test_instructor
        Given I am in the Sample Course class
        Given video upload is enabled
        
        # Set for students
        When I click the Instructor Dashboard button
        When I click the Manage Sources button
        Then I am at the Manage Sources page
        When I allow Students to upload videos
        Then I'm told "Your changes have been saved"
        
        # Instructor can see
        When I click the Source Media button
        Then I see "Upload Video"
        
        # Student can see
        When I log out
        When I type "test_student_one" for username
        When I type "test" for password
        When I click the Log In button
        Then I am at the Home page
        When I click the Source Media button
        Then I see "Upload Video"

        Finished using Selenium