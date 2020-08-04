import xlrd;
from datetime import date;
import datetime
import os.path
from os import path

# get today's excel
today = datetime.date.today()
today = today - datetime.timedelta(days=1)
#print(today);
todayexcel = today.strftime("%d-%b-%Y")
todaydate = today.strftime("%Y,%m,%d,0,0,0")
toddate = today.strftime("%Y,%m,%d")
# print(todayexcel)
fileloc = ("Data\\dailyexcels\\"+todayexcel+".xlsx")
if (path.exists(fileloc)):
    print("Found "+fileloc)
    with open("Data\\dates.dat") as myfile:
        if todaydate in myfile.read():
            print("dates.dat file already contains the date "+ todaydate)
        else:
            print('Adding today date to dates.dat file')
            filedates = open("Data\\dates.dat","a")
            filedates.write("\n"+todaydate)
            filedates.close()
            print('Completed Adding today date to dates.dat file')
            wb = xlrd.open_workbook(fileloc)
            sheet = wb.sheet_by_index(0)
            for i in range(sheet.nrows):    
                #elif a == b:
                if i != 0:
                    #print(sheet.cell_value(i,0))
                    regionname = sheet.cell_value(i,0)
                    if regionname == "Total AP Cases":
                        regionname = 'AndhraPradesh'
                    elif regionname == 'Anantapur':
                        regionname = 'Ananthapur'
                    elif regionname == 'Visakhapatnam':
                        regionname = 'Vishakapatnam'
                    elif regionname == 'Total':
                        regionname = 'TotalWithOthers'
                    filedata = open("Data\\"+regionname.replace(" ","")+".dat","a")        
                    filedata.write("\n")
                    print('Adding data to '+ regionname)
                    #filedata.close()
                    for j in range(sheet.ncols):
                        #print(j)
                        if j != 0:
                            if j > 1 and j != 5:
                                filedata.write(","+str(int(sheet.cell_value(i,j))))
                            elif j == 1:
                                filedata.write(str(int(sheet.cell_value(i,j))))
                            elif j == 5:
                                filedata.write("," + str(int(sheet.cell_value(i,j))) + "," + toddate)
                    filedata.close()
                    print('Completed Adding data to '+ regionname)
            print('Completed Adding data for '+ todayexcel)                            
else:
    print(fileloc+" excel does not exist.")
        
