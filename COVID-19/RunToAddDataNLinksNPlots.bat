@echo off
echo script to RunToAddDataNLinksNPlots STARTED at %time:~0,2%hrs%time:~3,2%min%time:~6,2%secs
set todaydatetime=%time:~0,2%hrs%time:~3,2%min%time:~6,2%secs_%date:~-7,2%-%date:~-10,2%-%date:~-4,4%
python "C:\Users\SGajula\NotBackedUp\Me\Learn\GitHub\deepuHub\COVID-19\adddatafortoday.py" > "Logs\file_adddata_%todaydatetime%.txt"
python "C:\Users\SGajula\NotBackedUp\Me\Learn\GitHub\deepuHub\COVID-19\addtodaylinks.py" > "Logs\file_addlinks_%todaydatetime%.txt"
rem timeout 10
rem octave --no-gui "c:\users\sgajula\notbackedup\me\learn\github\deepuhub\covid-19\plotcovid2019.m"
rem timeout 20
rem octave --no-gui "c:\users\sgajula\notbackedup\me\learn\github\deepuhub\covid-19\plottotalvsnewperday.m"
pause
echo script to RunToAddDataNLinksNPlots ENDED at %time:~0,2%hrs%time:~3,2%min%time:~6,2%secs
set commitdatetime=%time:~0,2%hrs%time:~3,2%min%time:~6,2%secs_%date:~-7,2%-%date:~-10,2%-%date:~-4,4% 
echo commitdatetime is %commitdatetime%
@echo on
git status
git commit -a -m "Auto-push for %commitdatetime% sample"
git push origin master
git status
pause