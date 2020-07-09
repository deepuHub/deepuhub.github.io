# Importing modules
import os
import shutil
import datetime
import os.path
from os import path

# get today
today = datetime.date.today()
#today = today - datetime.timedelta(days=1)
# get yesterday date formats required
yest = today - datetime.timedelta(days=1)
yestddmmmyyyy = str(yest.strftime("%d-%b-%Y"))
yestyyyymmdd = str(yest.strftime("%Y%m%d"))
yestddmmmyy = str(yest.strftime("%d-%b-%y"))
yestsummary = str(yest.strftime("%Y%m%d-Summary.md"))
yesttotvsnew= str(yest.strftime("%Y%m%d-TotalvsNew.md"))
# get today date formats required
todayddmmmyyy = str(today.strftime("%d-%b-%Y"))
todayddmmmyy = str(today.strftime("%d-%b-%y"))
todayyyyymmdd = str(today.strftime("%Y%m%d"))
todaysummary = str(today.strftime("%Y%m%d-Summary.md"))
todaytotvsnew= str(today.strftime("%Y%m%d-TotalvsNew.md"))


# update covid file to add today links
covidfile = "..\\pages\\COVID-19.md"
if (path.exists(covidfile)):
    with open(covidfile) as file:
        new_file_content = ""
        for line in file:
            #print(line)
            if yestyyyymmdd in line:
                todayline = line.replace(yestddmmmyyyy,todayddmmmyyy)
                todayline = todayline.replace(yestyyyymmdd,todayyyyymmdd)
                todayline = todayline.replace(yestddmmmyy,todayddmmmyy)
                #print(line)
                print("Adding Line - " + todayline)
                new_file_content += todayline
            elif yestddmmmyyyy in line:
                lastupdateddate = line.replace(yestddmmmyyyy,todayddmmmyyy)
                print("Updating Last updated date in Line to - " + lastupdateddate)
                new_file_content += lastupdateddate
                continue
            new_file_content += line
        #print(new_file_content)
        file = open("..\\pages\\COVID-19.md","w")
        file.write(new_file_content)
        file.close()
else:
    print(covidfile +" does not exist")


