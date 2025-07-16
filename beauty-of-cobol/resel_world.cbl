       IDENTIFICATION DIVISION.
       PROGRAM-ID. RESEL-WORLD.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      * A record that describes a user
       01 WS-USER.
         05 WS-FIRST-NAME PIC a(10).
         05 WS-LAST-NAME PIC a(10).
         05 WS-AGE PIC 9(2).
       01 WS-FULL-NAME PIC a(20).
       01 WS-CLOSE PIC a(1).
       01 WS-NEW-AGE PIC 9(2).
       01 WS-AGE-DELTA PIC 9(2) VALUE 10.

       PROCEDURE DIVISION.
      *    Run the code as performed paragraphs
           PERFORM GET-DATA
           PERFORM CALC-DATA
           PERFORM SHOW-DATA
           PERFORM FINISH-UP
       GOBACK.

      *    get user input
       GET-DATA.
           MOVE SPACE TO WS-USER WS-FULL-NAME
           DISPLAY "What is your first name?"
           ACCEPT WS-FIRST-NAME OF WS-USER
           DISPLAY "What is your last name?"
           ACCEPT WS-LAST-NAME OF WS-USER
           DISPLAY "What is your age?"
           ACCEPT WS-AGE OF WS-USER
           STRING WS-FIRST-NAME OF WS-USER DELIMITED BY SPACE
               SPACE DELIMITED BY SIZE
               WS-LAST-NAME OF WS-USER DELIMITED BY SPACE
               SPACE DELIMITED BY SIZE
               INTO WS-FULL-NAME
               ON OVERFLOW
               DISPLAY "Sorry, your data was truncated"
           END-STRING.
       CALC-DATA.
           ADD WS-AGE-DELTA WS-AGE OF WS-USER TO WS-NEW-AGE.

       SHOW-DATA.
           DISPLAY "Welcome " WS-FULL-NAME " In then years you will be:"
             WS-NEW-AGE.

       FINISH-UP.
           DISPLAY "Strike any key to continue"
           ACCEPT WS-CLOSE
           DISPLAY "Good bye".
       END PROGRAM RESEL-WORLD.
