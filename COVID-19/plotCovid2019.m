% run this everyday plotCovid2019;close;plotTotalvsNewPerDay;close;exit();
% Get the districts list
regionsstr = ["Ananthapur"; "Chittoor"; "EastGodavari"; "Guntur"; "Kadapa"; "Krishna"; "Kurnool"; "Nellore"; "Prakasam"; "Srikakulam"; "Vishakapatnam"; "Vizianagaram"; "WestGodavari"; "AndhraPradesh"; "OtherStates"; "OtherCountries"; "TotalWithOthers"];
% regionsstr = ["Ananthapur"; "AndhraPradesh"];
% regionsstr = ["Ananthapur"];
regionList = cellstr(regionsstr);
% Load covid cases data 
countRegions = size(regionList);
countRegions = countRegions(1);
% Store current date and time stamps														  
% todaydate = '12-Jul-2020';
todaydate = datestr(now(),'dd-mmm-yyyy');
todaydatetimewsecs = datestr(now(),'dd-mmm-yyyy HHMMSS');
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
	% plot(daterecords, Last24Hrs, "y^");
	plot(daterecords, TotalPositive,'b-o');	 
	% text (4, 4, {"Hello", "World"}, "horizontalalignment", "center", "verticalalignment", "middle");	
	% text (pi, 0.7, "arbitrary text");
	hold on;
	plot(daterecords, Active, "m-p");
	hold on;
	plot(daterecords, Discharged, 'g-d');
	hold on;
	plot(daterecords, Deceased, 'r-x');
	% set(gca,'color',[0 0 0]);
	% Put some labels 
	hold on;
	% Labels and Legend
	xlabel({'Date in dd-mmm format'; '(Source: @ArogyaAndhra)'});
	ylabel('Number of cases');		
	% grid minor;
	set (gca, "ygrid", "on");
	set (gca, "xminorgrid", "on");
	set (gca, "yaxislocation", "right");
	title ({[regionList{x} " COVID-19 Cases Summary as of " mat2str(datestrings(dtsize(1),3)) "-" mat2str(datestrings(dtsize(1),2)) "-" mat2str(datestrings(dtsize(1),1))]});	
	datetick ("x", 'dd-mmm', "keepticks");
	% Specified in plot order
	h = legend(["Positive cases - " mat2str(coviddata(dtsize(1),2)) " (Last 24 hrs - " mat2str(coviddata(dtsize(1),1)) " )"], ["Active cases - " mat2str(coviddata(dtsize(1),3))], ["Discharged cases - " mat2str(coviddata(dtsize(1),4))], ["Deceased cases - " mat2str(coviddata(dtsize(1),5))]);
	legend (h, "location", "northwest");	
		   
	% Print Plot to a jpg file 		
	imagename = [regionList{x} "_" todaydate ".jpg"];
	% save graph to a file
	% print -djpg 20-Apr-2020.jpg	
	print (["GraphsGenerated/" todaydate "/" imagename],'-djpg');
	hold off;
	% End Plot
	
	close;
	x=x+1;
endwhile

