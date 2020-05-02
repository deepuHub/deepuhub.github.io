# Importing modules
import os
import shutil
import datetime
import os.path
from os import path

# get today
today = datetime.date.today()
# get yesterday date formats required
yest = today - datetime.timedelta(days=1)
yestddmmmyyyy = str(yest.strftime("%d-%b-%Y"))
yestyyyymmdd = str(yest.strftime("%Y%m%d"))
yestsummary = str(yest.strftime("%Y%m%d-Summary.md"))
yesttotvsnew= str(yest.strftime("%Y%m%d-TotalvsNew.md"))
# get today date formats required
todayddmmmyyy = str(today.strftime("%d-%b-%Y"))
todayyyyymmdd = str(today.strftime("%Y%m%d"))
todaysummary = str(today.strftime("%Y%m%d-Summary.md"))
todaytotvsnew= str(today.strftime("%Y%m%d-TotalvsNew.md"))

#print(str(yest))
#print("Yest" + str(yest) + "Yest" + yestexcel + "Yest" +yestsummary + "Yest" +yesttotvsnew) 
#print("Today" + str(today) +"Today" + yestexcel +"Today" + yestsummary +"Today" + yesttotvsnew) 

# source file
srcsummary = "pages\\" + yestsummary
srctotvsnew = "pages\\" + yesttotvsnew
# destination file
destsummary = 'pages\\' + todaysummary
desttotvsnew = 'pages\\' + todaytotvsnew

if (path.exists(srcsummary)):
    if (path.exists(srctotvsnew)):
        # copy yest files for today
        shutil.copy(srcsummary,destsummary)
        shutil.copy(srctotvsnew,desttotvsnew)
        # update links in todays file

        # read file
        fin = open(destsummary,"rt")
        data = fin.read()
        data = data.replace(yestddmmmyyyy,todayddmmmyyy)
        fin.close()

        # open same file to write
        fin = open(destsummary, "wt")
        fin.write(data)
        fin.close()

        # read file
        fin = open(desttotvsnew,"rt")
        data = fin.read()
        data = data.replace(yestddmmmyyyy,todayddmmmyyy)
        fin.close()

        # open same file to write
        fin = open(desttotvsnew, "wt")
        fin.write(data)
        fin.close()

        # update covid file to add today links
        covidfile = "..\\pages\\COVID-19.md"
        if (path.exists(covidfile)):
            with open(covidfile) as file:
                for last_line in file:
                    lastline = last_line
            print(lastline)
            if yestddmmmyyyy in lastline:
                todayline = lastline.replace(yestddmmmyyyy,todayddmmmyyy)
                todayline = todayline.replace(yestyyyymmdd,todayyyyymmdd)
                print(todayline)
                file = open("..\\pages\\COVID-19.md","a")
                file.write("\n" + todayline)
                file.close()
        else:
            print(covidfile +" does not exist")
    else:
        print(srctotvsnew + "does not exist")
else:
    print(srcsummary + "does not exist")
    


