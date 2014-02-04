#USER STORIES

User Story 0
: As a Japanese language student
: I want to be able to add new words I learned to the database
: so that I can study them

Usage: ./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy

* Acceptance Criteria:
1. Saves the word in the database
2. Prints out a summary of what it saved
3. If kunyomi, english, JLPTlevel, or category are missing, it doesn't save the record and instead prints an error message
4. A corresponding row should be added to the skills table at the same time.



User Story 1
: As a Japanese language student
: I want to see a list of what I need to study to pass a JLPT (e.g. level N5) exam
: so that I can focus on only studying material needed for the test.

Usage: ./jstudy list --jlptlevel N5


* Acceptance Criteria:
1. Accepts input of a JLPT level
2. Prints a list of everything in the specified level's category.



User Story 2
: As a Japanese language student
: I want to see a list of what I have already studied and mastered
: so that I can check my progress.

Usage: ./jstudy status --jlptlevel N5 --abilitylevel 1

* Acceptance Criteria:
1. Accepts a user input specifying the JLPT level's already studied and mastered records
2. Prints a list of already studied records in the specified level.


User Story 3
: As a Japanese language student
: I want to see a list of what I have not yet studied
: so that I can see how much work I still have to do.

Usage: ./jstudy status --jlptlevel N5

* Acceptance Criteria:
1. Accepts a user input specifying the JLPT level's not yet studied records
2. Prints a list of not yet studied records in the specified level.


User Story 4
: As a Japanese language student
: I want to see a list of terms I'm having trouble with
: so that I can focus my study on problem areas.

Usage: ./jstudy status --jlptlevel N5 --abilitylevel 0

* Acceptance Criteria:
1. Accepts a user input specifying the JLPT level's problem area records
2. Prints a list of problem records in the specified level.



User Story 5
: As a Japanese language student
: I want to be able to start a kanji practice session for a specific jlpt level
: so that I can focus my study just on the kanji knowledge portion of the exam

Usage: ./jstudy start
k
1..5

Acceptance Criteria:
1. Accepts user input command to start the test
2. Prints a confirmation that the kanji test is ready to begin


User Story 5a
: As a Japanese language student
: I want to see a random kanji category word I don't yet know when I press a key
: so that I can see if I know the correct kanji, pronunciation or English translation.

Usage: "k" (when starting the session)
Usage: "y" (when continuing the session after getting an answer right)
Usage: "n" (when continuing the session after getting an answer wrong)

* Acceptance Criteria:
1. Accepts a user input key that links to unknown kanji category word for the correct JLPT level
2. Prints a randomly selected single kanji category word from the specified level.
3. Words not specified as required kanji but only as required vocabulary are not included.


User Story 5b
: As a Japanese language student
: I want to see the correct answer for the vocabulary category word already on the screen when I press a key
: so that I can check if my answer was correct.

Usage: "y" (when continuing the session after getting an answer right)
Usage: "n" (when continuing the session after getting an answer wrong)

* Acceptance Criteria:
1. Accepts a user input key that prints the correct answer for the current vocabulary category word



User Story 5c (update)
: As a Japanese language student
: I want to update the record for the kanji currently on the screen when I press a key
: so that I can keep up to date with what I have learned.

Usage: "y" || "n" (during a kanji study session after seeing a quiz word)

* Acceptance Criteria:
1. Accepts one of two user input keys that link to the pronunciation status of the current kanji
2. Updates the record to '1' or '0' for 'y' or 'n', respectively.




User Story 6
: As a Japanese language student
: I want to be able to start a vocabulary practice session for a specific jlpt level
: so that I can focus my study just on the vocabulary knowledge portion of the exam

Usage: ./jstudy start
v
1..5

Acceptance Criteria:
1. Accepts user input command to start the test
2. Prints a confirmation that the vocabulary test is ready to begin


User Story 6a
: As a Japanese language student
: I want to see a random vocabulary category word I don't yet know when I press a key
: so that I can see if I know the correct pronunciation or English translation.

Usage: "v" (only once, when starting the session)
Usage: "y" (when continuing the session after getting an answer right)
Usage: "n" (when continuing the session after getting an answer wrong)

* Acceptance Criteria:
1. Accepts a user input key that links to unknown vocabulary category words for the correct JLPT level
2. Prints a randomly selected single vocabulary category word from the specified level.
3. Words not specified as required vocabulary but only as required kanji are not included.


User Story 6b
: As a Japanese language student
: I want to see the correct answer for the kanji category word already on the screen when I press a key
: so that I can check if my answer was correct.

Usage: "y" (when continuing the session after getting an answer right)
Usage: "n" (when continuing the session after getting an answer wrong)

* Acceptance Criteria:
1. Accepts a user input key that prints the correct answer for the current kanji category word



User Story 6c (update)
: As a Japanese language student
: I want to update the record for the kanji currently on the screen when I press a key
: so that I can keep up to date with what I have learned.

Usage: "y" || "n" (during a kanji study session after seeing a quiz word)

* Acceptance Criteria:
1. Accepts one of two user input keys that link to the pronunciation status of the current kanji
2. Updates the record to '1' or '0' for 'y' or 'n', respectively.



User Story 7 (exit)
: As a Japanese language student
: I want to be able to stop a kanji practice session
: so that I can finish studying for the kanji knowledge portion of the exam

Usage: "q" (during a kanji study session)

Acceptance Criteria:
1. Accepts user input command to stop the test
2. Prints a confirmation that the kanji test is exited


User Story 8 (exit)
: As a Japanese language student
: I want to be able to stop a vocabulary practice session
: so that I can finish studying for the vocabulary knowledge portion of the exam

Usage: "q" (during a vocabulary study session)

Acceptance Criteria:
1. Accepts user input command to stop the test
2. Prints a confirmation that the vocabulary test is exited



User Story 9 (view keyboard commands)
: As a Japanese language student
: I want to know what keyboard commands are available to me at any point in the exercise
: so that I know how to proceed with the study exercise.

Usage: (N/A)

* Acceptance Criteria:
1. Prints a list of keyboard input options during every screen of all user stories.


User Story 10 (delete record)
: As a Japanese language student
: I want to be able to delete a record from the database if necessary
: so that I know I am not studying errors.

Usage: "delete" (followed by 'Are you sure (Y/N)?') "y"

* Acceptance Criteria:
1. Accepts a user input to delete the requested record.
2. Prints the requested row of data and asks for confirmation to delete.
3. Prints a confirmation message that the delete was successful if 'y' was entered.
4. Prints a confirmation message that the row was not deleted if 'n' was entered.


User Story 11 (update record)
: As a Japanese language student
: I want to update a record in the database if necessary
: so that I know I am studying correct information.

Usage: ./jstudy edit --id #{id} --kunyomi #{kunyomi} --english #{kunyomi} --jlptlevel #{jlptlevel} --category #{category}

* Acceptance Criteria:
1. Prints the requested row of data with column headers.
2. Accepts input of column header followed by new data to overwrite the currect data point with.
3. Prints a confirmation message that the update was successful.