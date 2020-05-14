% Load the Dates first from a separate file
datestrings = load("Data\\dates.dat");
% convert dates into datenum format for plotting
daterecords = datenum(datestrings(:,1),datestrings(:,2),datestrings(:,3));
% Get the districts list
regionsstr = ["Ananthapur"; "Chittoor"; "EastGodavari"; "Guntur"; "Kadapa"; "Krishna"; "Kurnool"; "Nellore"; "Prakasam"; "Srikakulam"; "Vishakapatnam"; "Vizianagaram"; "WestGodavari"; "AndhraPradesh"];
% regionsstr = ["AndhraPradesh"];
% regionsstr = ["Ananthapur"];
regionList = cellstr(regionsstr);
% Load covid cases data 
countRegions = size(regionList);
countRegions = countRegions(1);
countDates = size(datestrings);
countDates = countDates(1);
% Store current date and time stamps
todaydate = datestr(now(),'dd-mmm-yyyy');
todaydatetimewsecs =  datestr(now(),'dd-mmm-yyyy HHMMSS');
% create folder for graphs 
mkdir("GraphsGenerated", todaydate);
Last24hours = zeros(countDates,countRegions);
x=1;
while x<=countRegions  
	coviddata = load(["Data\\" regionList{x} ".dat"]);
	% save case types in variables  
	Last24Hrs = coviddata(:,1);
	TotalPositive = coviddata(:,2);
	Active = coviddata(:,3);
	Discharged = coviddata(:,4); 
	Deceased = coviddata(:,5); 
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

	h = legend({'Total Number of cases cumulative', 'Number of New cases per day'}, "location", "northwest");	
	% % Print Plot to a jpg file 		
	imagename = ["Last24Hrs_" regionList{x} "_" todaydate ".jpg"];
	% save graph to a file
	% print -djpg 20-Apr-2020.jpg	
	print (["GraphsGenerated/" todaydate "/" imagename],'-djpg');
	hold off;
	% End Plot	
	x=x+1;
endwhile


