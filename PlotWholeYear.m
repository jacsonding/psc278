%Plot whole year
startTime = 1388534400; %UTC of 2014/1/1 0:00
endTime = 1420070399; %UTC of 2014/12/31 23:59
dayDuration = 86400;

%extras :D
xmas = 1419465600;

dailyMeans=[];
dailyN=[];
dailySTD = [];

for i=startTime:dayDuration:endTime
    dM=mean(x.Scaled(x.created_utc>i&x.created_utc<(i+dayDuration)));
    dSTD = std(x.Scaled(x.created_utc>i&x.created_utc<(i+dayDuration)));
    dN=sum(x.created_utc>i&x.created_utc<(i+dayDuration));
    
    dailySTD = [dailySTD, dSTD];
    dailyMeans = [dailyMeans,dM];
    dailyN = [dailyN,dN];
end

%% Plotting
% whole year average
dailyMeans = movmean(dailyMeans,10);
ActuallyPlotWholeYear(dailyMeans,'Average Sentiment per Day of 2014');
print('~/Downloads/WholeYear_Lin_MovMean10','-dpng','-r300');