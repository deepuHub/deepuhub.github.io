# Importing modules
import os
import shutil
import datetime
import os.path
from os import path

# get today
today = datetime.date.today()
deltadays = 9
while deltadays > 8:
    today = today - datetime.timedelta(days=deltadays)
    # get yesterday date formats required
    yest = today - datetime.timedelta(days=deltadays-1)
    yestddmmmyyyy = str(yest.strftime("%d-%b-%Y"))
    yestyyyymmdd = str(yest.strftime("%Y%m%d"))
    yestsummaryntotvsnew= str(yest.strftime("%Y%m%d-SummaryNTotalvsNew.md"))
    # get today date formats required
    todayddmmmyyy = str(today.strftime("%d-%b-%Y"))
    todayyyyymmdd = str(today.strftime("%Y%m%d"))
    todaysummaryntotvsnew= str(today.strftime("%Y%m%d-SummaryNTotalvsNew.md"))

    #print(str(yest))
    #print("Yest" + str(yest) + "Yest" + yestexcel + "Yest" +yestsummary + "Yest" +yesttotvsnew) 
    #print("Today" + str(today) +"Today" + yestexcel +"Today" + yestsummary +"Today" + yesttotvsnew) 

    # source file
    srcsummaryntotvsnew = "pages\\" + yestsummaryntotvsnew
    # destination file
    destsummaryntotvsnew = 'pages\\' + todaysummaryntotvsnew

    if (path.exists(srcsummaryntotvsnew)):
        # copy yest files for today
        shutil.copy(srcsummaryntotvsnew,destsummaryntotvsnew)
        # update links in todays file

        # read file
        fin = open(destsummaryntotvsnew,"rt")
        data = fin.read()
        data = data.replace(yestddmmmyyyy,todayddmmmyyy)
        fin.close()

        # open same file to write
        fin = open(destsummaryntotvsnew, "wt")
        fin.write(data)
        fin.close()    
    else:
        print(srcsummaryntotvsnew + "does not exist")
    print(deltadays)
    deltadays -= 1
    


