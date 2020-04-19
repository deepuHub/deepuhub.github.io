% Load the Dates first from a separate file
datestrings = load("dates.dat");
% convert dates into datenum format for plotting
daterecords = datenum(datestrings(:,1),datestrings(:,2),datestrings(:,3));
% Load covid cases district data 
coviddata = load("Anantapur.dat");
% save case types in variables  
TotalPositive = coviddata(:,1);
Active = coviddata(:,2);
Discharged = coviddata(:,3); 
Deceased = coviddata(:,4); 
% Begin Plot 
plot(daterecords, TotalPositive, "b-o");
title ("Anantapur District Covid-19 Cases so far");
datetick ("x", 6, "keepticks");
hold on;
plot(daterecords, Active, "m--*");
hold on;
plot(daterecords, Discharged, 'g-d');
hold on;
plot(daterecords, Deceased, 'r:x');

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
print -djpg 19-Apr-2020.jpg
hold off;