import xlrd;
from datetime import date;
import os.path
from os import path

# get today's excel
today = date.today()
todayexcel = today.strftime("%d-%b-%Y")
todaydate = today.strftime("%Y,%m,%d,0,0,0")
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
                    if regionname == "Total":
                        regionname = 'AndhraPradesh'
                    elif regionname == 'Anantapur':
                        regionname = 'Ananthapur'
                    elif regionname == 'Visakhapatnam':
                        regionname = 'Vishakapatnam'                    
                    filedata = open("Data\\"+regionname.replace(" ","")+".dat","a")        
                    filedata.write("\n")
                    print('Adding data to '+ regionname)
                    #filedata.close()
                    for j in range(sheet.ncols):
                        if j != 0:
                            if j != 1:
                                filedata.write(","+str(int(sheet.cell_value(i,j))))
                            else:
                                filedata.write(str(int(sheet.cell_value(i,j))))
                    filedata.close()
                    print('Completed Adding data to '+ regionname)
            print('Completed Adding data for '+ todayexcel)                            
else:
    print(fileloc+" excel does not exist.")
        
