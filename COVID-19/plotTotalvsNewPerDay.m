% Get the districts list
regionsstr = ["Ananthapur"; "Chittoor"; "EastGodavari"; "Guntur"; "Kadapa"; "Krishna"; "Kurnool"; "Nellore"; "Prakasam"; "Srikakulam"; "Vishakapatnam"; "Vizianagaram"; "WestGodavari"; "AndhraPradesh"];
% regionsstr = ["Ananthapur"; "AndhraPradesh"];
% regionsstr = ["Ananthapur"];
regionList = cellstr(regionsstr);
% Load covid cases data 
countRegions = size(regionList);
countRegions = countRegions(1);
% Store current date and time stamps
todaydate = '12-Jul-2020'; 
% todaydate = datestr(now(),'dd-mmm-yyyy');
todaydatetimewsecs =  datestr(now(),'dd-mmm-yyyy HHMMSS');
% create folder for graphs 
mkdir("GraphsGenerated", todaydate);
x=1;
while x<=countRegions  
	coviddata = load(["Data\\" regionList{x} ".dat"]);
	% save case types in variables  
	Last24Hrs = coviddata(:,1);
	TotalPositive = coviddata(:,2);
	Active = coviddata(:,3);
	Discharged = coviddata(:,4); 
	Deceased = coviddata(:,5); 
	daterecords = datenum(coviddata(:,6),coviddata(:,7),coviddata(:,8));
	datestrings = coviddata(:,6:8);
	dtsize = size(datestrings);
	% Begin Plot		
    [AX H1 H2] = plotyy(daterecords, TotalPositive, daterecords, Last24Hrs, 'plot');	
	xlabel({'Date in dd-mmm format'; '(Source: @ArogyaAndhra)'});	
	ylabel(AX(1), 'Total Number of cases cumulative');
	ylabel(AX(2), 'Number of New cases per day');	
	% % grid minor;
	% % set (gca, "yaxislocation", "left");
	% datetick ("x", 'dd-mmm');
	datetick(AX(1), 'x', 'dd-mmm')
	datetick(AX(2), 'x', 'dd-mmm')
	% % Specified in plot order
	title ({[regionList{x} " COVID-19 'Total cases cumulative' vs 'New cases per day' as of " mat2str(datestrings(dtsize(1),3)) "-" mat2str(datestrings(dtsize(1),2)) "-" mat2str(datestrings(dtsize(1),1))]});	

	h = legend({['Number of New cases per day - ' mat2str(coviddata(dtsize(1),1))], ['Total Number of cases cumulative - ' mat2str(coviddata(dtsize(1),2))]}, "location", "northwest");	
	% % Print Plot to a jpg file 		
	imagename = ["Last24Hrs_" regionList{x} "_" todaydate ".jpg"];
	% save graph to a file
	% print -djpg 20-Apr-2020.jpg	
	print (["GraphsGenerated/" todaydate "/" imagename],'-djpg');
	hold off;
	close;
	% End Plot	
	x=x+1;
endwhile


