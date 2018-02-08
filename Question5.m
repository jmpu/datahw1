thick = csvread('thick.csv',1,1);

boxplot(thick(1:100,:));
% xlabel('All Vehicles')
% ylabel('Miles per Gallon (MPG)')
% title('Miles per Gallon for All Vehicles')