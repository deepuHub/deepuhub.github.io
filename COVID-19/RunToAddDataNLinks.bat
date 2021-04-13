@echo off
echo script to RunToAddDataNLinksNPlots STARTED at %time:~0,2%hrs%time:~3,2%min%time:~6,2%secs
set todaydatetime=%time:~0,2%hrs%time:~3,2%min%time:~6,2%secs_%date:~-7,2%-%date:~-10,2%-%date:~-4,4%
echo Adding Data for Today
python "C:\Users\sgajula\Documents\Me\Learn\GitHub\deepuHub\COVID-19\adddatafortoday.py" > "Logs\file_adddata_%todaydatetime%.txt"
echo Adding Links for Today
python "C:\Users\sgajula\Documents\Me\Learn\GitHub\deepuHub\COVID-19\addtodaylinks.py" > "Logs\file_addlinks_%todaydatetime%.txt"
timeout 15
