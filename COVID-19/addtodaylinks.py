# Importing modules
import os
import shutil
import datetime
import os.path
from os import path

# get today
today = datetime.date.today()
today = today - datetime.timedelta(days=4)
# get yesterday date formats required
yest = today - datetime.timedelta(days=5)
yestddmmmyyyy = str(yest.strftime("%d-%b-%Y"))
yestddmmmyy = str(yest.strftime("%d-%b-%y"))
yestyyyymmdd = str(yest.strftime("%Y%m%d"))
yestplots = str(yest.strftime("%Y%m%d-Plots.md"))
yestsummary = str(yest.strftime("%Y%m%d-Summary.md"))
yesttotvsnew= str(yest.strftime("%Y%m%d-TotalvsNew.md"))
# get today date formats required
todayddmmmyyy = str(today.strftime("%d-%b-%Y"))
todayddmmmyy = str(today.strftime("%d-%b-%y"))
todayyyyymmdd = str(today.strftime("%Y%m%d"))
todayplots = str(today.strftime("%Y%m%d-Plots.md"))
todaysummary = str(today.strftime("%Y%m%d-Summary.md"))
todaytotvsnew= str(today.strftime("%Y%m%d-TotalvsNew.md"))

#print(str(yest))
#print("Yest" + str(yest) + "Yest" + yestexcel + "Yest" +yestsummary + "Yest" +yesttotvsnew) 
#print("Today" + str(today) +"Today" + yestexcel +"Today" + yestsummary +"Today" + yesttotvsnew) 

# source file
srcplots = "pages\\" + yestplots
srcsummary = "pages\\" + yestsummary
srctotvsnew = "pages\\" + yesttotvsnew
# destination file
destplots = 'pages\\' + todayplots
destsummary = 'pages\\' + todaysummary
desttotvsnew = 'pages\\' + todaytotvsnew
if(path.exists(destsummary)):
    print("Today's links already added.")
elif (path.exists(srcsummary)):
    if (path.exists(srctotvsnew)):
        # copy yest files for today
        shutil.copy(srcplots,destplots)
        shutil.copy(srcsummary,destsummary)
        shutil.copy(srctotvsnew,desttotvsnew)
        # update links in todays file

         # read file
        fin = open(destplots,"rt")
        data = fin.read()
        data = data.replace(yestddmmmyyyy,todayddmmmyyy)
        fin.close()

        # open same file to write
        fin = open(destplots, "wt")
        fin.write(data)
        fin.close()

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
        print("Added file and links for " + str(today));
        ## update covid file to add today links
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
    else:
        print(srctotvsnew + "does not exist")
else:
    print(srcsummary + "does not exist")
    


