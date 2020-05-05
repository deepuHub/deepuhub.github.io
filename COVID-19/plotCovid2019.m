% run this everyday plotCovid2019;close;plotTotalvsNewPerDay;close;exit();
% Load the Dates first from a separate file
datestrings = load("Data\\dates.dat");
% convert dates into datenum format for plotting
daterecords = datenum(datestrings(:,1),datestrings(:,2),datestrings(:,3));
% Get the districts list
regionsstr = ["Ananthapur"; "Chittoor"; "EastGodavari"; "Guntur"; "Kadapa"; "Krishna"; "Kurnool"; "Nellore"; "Prakasam"; "Srikakulam"; "Vishakapatnam"; "Vizianagaram"; "WestGodavari"; "AndhraPradesh"; "Others"];
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
todaydatetimewsecs = datestr(now(),'dd-mmm-yyyy HHMMSS');
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
	h = legend('Positive cases', 'Active cases', 'Discharged cases', 'Deceased cases');
	legend (h, "location", "northwest");	
		   
	% Print Plot to a jpg file 		
	imagename = [regionList{x} "_" todaydate ".jpg"];
	% save graph to a file
	% print -djpg 20-Apr-2020.jpg	
	print (["GraphsGenerated/" todaydate "/" imagename],'-djpg');
	hold off;
	% End Plot
	
	% Last24hours(:,x) = Last24Hrs; 

	% Figure to plot the new cases in the last 24 hrs
	% figure; % open a new figure window
	% plot(daterecords, Last24Hrs, "c-*");	
	% hold on;
	% % Labels and Legend
	% xlabel({'Date in dd-mmm format'; '(Source: @ArogyaAndhra)'});
	% ylabel('Number of New Positive cases per Day');	
	% % grid minor;
	% set (gca, "ygrid", "on");
	% set (gca, "xminorgrid", "on");
	% set (gca, "yaxislocation", "right");
	% title ({[regionList{x} " COVID-19 Summary of New Positive cases per Day as of " mat2str(datestrings(dtsize(1),3)) "-" mat2str(datestrings(dtsize(1),2)) "-" mat2str(datestrings(dtsize(1),1))]});	
	% datetick ("x", 'dd-mmm', "keepticks");h = legend('New cases in Last 24Hrs');
	% legend (h, "location", "northwest");
	% % Print Plot to a jpg file 		
	% Last24Hrsimagename = [regionList{x} "_Last24Hrs_" todaydate ".jpg"];
	% % save graph to a file
	% % print -djpg 20-Apr-2020.jpg	
	% print (["GraphsGenerated/" todaydate "/" Last24Hrsimagename],'-djpg');
	% hold off;
	x=x+1;
endwhile

