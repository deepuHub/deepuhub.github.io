@echo off
REM echo script to RunToAddDataNLinksNPlots STARTED at %time:~0,2%hrs%time:~3,2%min%time:~6,2%secs
REM set todaydatetime=%time:~0,2%hrs%time:~3,2%min%time:~6,2%secs_%date:~-7,2%-%date:~-10,2%-%date:~-4,4%
REM echo Adding Data for Today
REM python "C:\Users\sgajula\Documents\Me\Learn\GitHub\deepuHub\COVID-19\adddatafortoday.py" > "Logs\file_adddata_%todaydatetime%.txt"
REM echo Adding Links for Today
REM python "C:\Users\sgajula\Documents\Me\Learn\GitHub\deepuHub\COVID-19\addtodaylinks.py" > "Logs\file_addlinks_%todaydatetime%.txt"
REM timeout 15
REM echo Generating Plots - Summary
REM octave --no-gui "C:\Users\sgajula\Documents\Me\Learn\GitHub\deepuHub\COVID-19\plotcovid2019.m"
REM echo Generating Plots - Total vs New
REM octave --no-gui "C:\Users\sgajula\Documents\Me\Learn\GitHub\deepuHub\COVID-19\plottotalvsnewperday.m"
REM timeout 90
REM echo script to RunToAddDataNLinksNPlots ENDED at %time:~0,2%hrs%time:~3,2%min%time:~6,2%secs
set commitdatetime=%time:~0,2%hrs%time:~3,2%min%time:~6,2%secs_%date:~-7,2%-%date:~-10,2%-%date:~-4,4% 
echo commitdatetime is %commitdatetime%
@echo on
git status
timeout 10
git add .
timeout 10
git commit -a -m "Auto-push for %commitdatetime%"
timeout 15
git push origin master
timeout 10
git status
timeout 7