#USER STORIES

User Story 1
    As a Japanese language student
    I want to see a list of what I need to study to pass a JLPT (e.g. level N5) exam
    so that I can focus on only studying material needed for the test.

* Acceptance Criteria:
1. Accepts input of a JLPT level
2. Prints a list of everything in the specified level's category.


User Story 2
    As a Japanese language student
    I want to see a list of what I have already studied
    so that I can check my progress.

* Acceptance Criteria:
1. Accepts a user input specifying the JLPT level's already studied records
2. Prints a list of already studied records in the specified level.


User Story 3
    As a Japanese language student
    I want to see a list of what I have not yet studied
    so that I can see how much work I still have to do.

* Acceptance Criteria:
1. Accepts a user input specifying the JLPT level's not yet studied records
2. Prints a list of not yet studied records in the specified level.


User Story 4
    As a Japanese language student
    I want to see a list of terms I'm having trouble with
    so that I can focus my study on problem areas.

* Acceptance Criteria:
1. Accepts a user input specifying the JLPT level's problem area records
2. Prints a list of problem records in the specified level.



User Story 5a (kanji -->English & pronunciation)
    As a Japanese language student
    I want to see a random kanji word I don't yet know when I press a key
    so that I can see if I know the correct pronunciation or English translation.

* Acceptance Criteria:
1. Accepts a user input key that links to unknown kanji for the correct JLPT level
2. Prints a randomly selected single kanji from the specified level.
3. Kanji not specified as required kanji but only as required vocabulary are not included.


User Story 5b (kanji --> display pronunciation)
    As a Japanese language student
    I want to see the correct pronunciation for the kanji already on the screen when I press a key
    so that I can check if my answer was correct.

* Acceptance Criteria:
1. Accepts a user input key that links to pronunciation of the current kanji
2. Prints both the current kanji and the associated pronunciation.


User Story 5c (kanji --> display English)
    As a Japanese language student
    I want to see the correct English translation for the kanji already on the screen when I press a key
    so that I check if my answer was correct.

* Acceptance Criteria:
1. Accepts a user input key that links to the English translation of the current kanji
2. Prints both the current kanji and the associated English translation.


User Story 5d (update)
    As a Japanese language student
    I want to update the record for the kanji on the screen when I press a key
    so that I can keep up to date with what I have learned.

* Acceptance Criteria:
1. Accepts two user input keys that link to the pronunciation status of the current kanji
2. Updates the record to 'know' or 'needs review' depending on the key.
3. Accepts two user input keys that link to the translation status of the current kanji
4. Updates the record to 'know' or 'needs review' depending on the key.



User Story 6a (pronunciation --> kanji & English)
    As a Japanese language student
    I want to see a random pronunciation of a kanji category word I don't yet know when I press a key
    so that I can see if I know the correct kanji or English translation.

* Acceptance Criteria:
1. Accepts a user input key that links to unknown pronunciations for the correct JLPT level
2. Prints a randomly selected single pronunciation from kanji category words at the specified level.
3. Pronunciations not specified as required kanji but only as required vocabulary are not included.


User Story 6b (pronunciation --> display kanji)
    As a Japanese language student
    I want to see the correct kanji for the pronunciation already on the screen when I press a key
    so that I can check if my answer was correct.

* Acceptance Criteria:
1. Accepts a user input key that links to the kanji for the current pronunciation
2. Prints both the current pronunciation and the associated kanji.


User Story 6c (pronunciation --> display English)
    As a Japanese language student
    I want to see the correct English translation for the pronunciation already on the screen when I press a key
    so that I check if my answer was correct.

* Acceptance Criteria:
1. Accepts a user input key that links to the English translation of the current pronunciation
2. Prints both the current pronunciation and the associated English translation.


User Story 6d (update)
    As a Japanese language student
    I want to update the record for the pronunciation on the screen when I press a key
    so that I can keep up to date with what I have learned.

* Acceptance Criteria:
1. Accepts two user input keys that link to the kanji status of the current pronunciation
2. Updates the record to 'know' or 'needs review' depending on the key.
3. Accepts two user input keys that link to the translation status of the current pronunciation
4. Updates the record to 'know' or 'needs review' depending on the key.



User Story 7a (English --> kanji & pronunciation)
    As a Japanese language student
    I want to see a random English word for a kanji category word I don't yet know when I press a key
    so that I can see if I know the correct kanji or pronunciation.

* Acceptance Criteria:
1. Accepts a user input key that links to unknown English words for the correct JLPT level
2. Prints a randomly selected single English word from kanji category words at the specified level.
3. English words not specified as required kanji but only as required vocabulary are not included.


User Story 7b (English --> display kanji)
    As a Japanese language student
    I want to see the correct kanji for the English word already on the screen when I press a key
    so that I can check if my answer was correct.

* Acceptance Criteria:
1. Accepts a user input key that links to the kanji for the current English word
2. Prints both the current English word and the associated kanji.


User Story 7c (English --> display pronunciation)
    As a Japanese language student
    I want to see the correct pronunciation for the English word already on the screen when I press a key
    so that I check if my answer was correct.

* Acceptance Criteria:
1. Accepts a user input key that links to the pronunciation of the current English word
2. Prints both the current English word and the associated pronunciation.


User Story 7d (update)
    As a Japanese language student
    I want to update the record for the English word on the screen when I press a key
    so that I can keep up to date with what I have learned.

* Acceptance Criteria:
1. Accepts two user input keys that link to the kanji status of the current Englsih word
2. Updates the record to 'know' or 'needs review' depending on the key.
3. Accepts two user input keys that link to the translation status of the current English word
4. Updates the record to 'know' or 'needs review' depending on the key.



User Story 8a (English --> Japanese)
    As a Japanese language student
    I want to see a random English word for a vocabulary category word I don't yet know when I press a key
    so that I can see if I know the correct Japanese translation.

* Acceptance Criteria:
1. Accepts a user input key that links to unknown English words for the correct JLPT level
2. Prints a randomly selected single English word from vocabulary category words at the specified level.
3. English words specified as required kanji are not included.


User Story 8b ( English --> display Japanese)
    As a Japanese language student
    I want to see the correct Japanese translation for the English word already on the screen when I press a key
    so that I can check if my answer was correct.

* Acceptance Criteria:
1. Accepts a user input key that links to the Japanese translation for the current English word
2. Prints both the current English word and the associated Japanese translation.


User Story 8c (update)
    As a Japanese language student
    I want to update the record for the English word on the screen when I press a key
    so that I can keep up to date with what I have learned.

* Acceptance Criteria:
1. Accepts two user input keys that link to the Japanese translation status of the current English word
2. Updates the record to 'know' or 'needs review' depending on the key.



User Story 9a (Japanese --> English)
    As a Japanese language student
    I want to see a random Japanese word for a vocabulary category word I don't yet know when I press a key
    so that I can see if I know the correct English translation.

* Acceptance Criteria:
1. Accepts a user input key that links to unknown Japanese words for the correct JLPT level
2. Prints a randomly selected single Japanese word from vocabulary category words at the specified level
3. Japanese words specified as required kanji are not included.


User Story 9b ( Japanese --> display English)
    As a Japanese language student
    I want to see the correct English translation for the Japanese word already on the screen when I press a key
    so that I can check if my answer was correct.

* Acceptance Criteria:
1. Accepts a user input key that links to the English translation for the current Japanese word
2. Prints both the current Japanese word and the associated English translation.


User Story 9c (update)
    As a Japanese language student
    I want to update the record for the Japanese word on the screen when I press a key
    so that I can keep up to date with what I have learned.

* Acceptance Criteria:
1. Accepts two user input keys that link to the English translation status of the current Japanese word
2. Updates the record to 'know' or 'needs review' depending on the key.



User Story 10
    As a Japanese language student
    I want to know what keyboard commands are available to me at any point in the exercise
    so that I know how to proceed with the study exercise.

* Acceptance Criteria:
1. Prints a list of keyboard input options during every screen of all user stories.