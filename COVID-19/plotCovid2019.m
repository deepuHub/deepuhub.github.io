% Load the Dates first from a separate file
datestrings = load("dates.dat");
% convert dates into datenum format for plotting
daterecords = datenum(datestrings(:,1),datestrings(:,2),datestrings(:,3));
% Get the districts list
diststr = ["Ananthapur"; "Chittoor"; "EastGodavari"; "Guntur"; "Kadapa"; "Krishna"; "Kurnool"; "Nellore"; "Prakasam"; "Srikakulam"; "Vishakapatnam"; "Vizianagaram"; "WestGodavari"; "AndhraPradesh"];
% diststr = ["Ananthapur"];
distList = cellstr(diststr);
% Load covid cases district data 
countDists = size(distList);
countDists = countDists(1);
x=1;
while x<=countDists 
	coviddata = load([distList{x} ".dat"]);
	% save case types in variables  
	TotalPositive = coviddata(:,1);
	Active = coviddata(:,2);
	Discharged = coviddata(:,3); 
	Deceased = coviddata(:,4); 
	dtsize = size(datestrings);
	% Begin Plot 
	plot(daterecords, TotalPositive, "b-o");
	% grid minor;
	set (gca, "ygrid", "on");
	set (gca, "xminorgrid", "on");
	title ([distList{x} " District Covid-19 Cases as of " mat2str(datestrings(dtsize(1),3)) "-" mat2str(datestrings(dtsize(1),2)) "-" mat2str(datestrings(dtsize(1),1))]);
	datetick ("x", 6, "keepticks");
	hold on;
	plot(daterecords, Active, "m--*");
	hold on;
	plot(daterecords, Discharged, 'g-d');
	hold on;
	plot(daterecords, Deceased, 'r:x');
	% set(gca,'color',[0 0 0]);
	% Put some labels 
	hold on;
	% Labels and Legend
	xlabel('Date (dd/mm)');
	ylabel('# of cases');
	% Specified in plot order
	h = legend('Positive cases', 'Active cases', 'Discharged cases', 'Deceased cases');
	legend (h, "location", "northwest");
	% End Plot
	% Print Plot to a jpg file 	
	imagename = [distList{x} "_" mat2str(datestrings(dtsize(1),1)) mat2str(datestrings(dtsize(1),2)) mat2str(datestrings(dtsize(1),3)) ".jpg"];
	% print -djpg 20-Apr-2020.jpg
	print (imagename,'-djpg');
	hold off;
	x=x+1;
endwhile
