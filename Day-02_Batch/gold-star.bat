@ECHO OFF
SETLOCAL

SET /A score=0

FOR /f "tokens=*" %%s IN (input-01.txt) DO (
    CALL :process_line %%s
)
ECHO %score%


PAUSE


:process_line
SET line=%~1 %~2
SET opponent=%line:~0,1%
SET response=%line:~-1%

IF "%response%"=="X" (
    IF "%opponent%" == "A" SET /A score=score+3
    IF "%opponent%" == "B" SET /A score=score+1
    IF "%opponent%" == "C" SET /A score=score+2
)
IF "%response%"=="Y" (
    SET /A score=score+3
    IF "%opponent%" == "A" SET /A score=score+1
    IF "%opponent%" == "B" SET /A score=score+2
    IF "%opponent%" == "C" SET /A score=score+3
)
IF "%response%"=="Z" (
    SET /A score=score+6
    IF "%opponent%" == "A" SET /A score=score+2
    IF "%opponent%" == "B" SET /A score=score+3
    IF "%opponent%" == "C" SET /A score=score+1
)
::ECHO opponent:%opponent%,response:%response%,%score%
EXIT /B

ENDLOCAL