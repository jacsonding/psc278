%Plot whole year
startTime = 1388534400; %UTC of 2014/1/1 0:00
endTime = 1420070399; %UTC of 2014/12/31 23:59
dayDuration = 86400;

%extras :D
xmas = 1419465600;

dailyMeans=[];
dailyN=[];

for i=startTime:dayDuration:endTime
    dM=mean(reddit.Sentiment(reddit.created_utc>i&reddit.created_utc<(i+dayDuration)));
    dN=sum(reddit.created_utc>i&reddit.created_utc<(i+dayDuration));
    
    dailyMeans = [dailyMeans,dM];
    dailyN = [dailyN,dN];
end

%% Plotting
% whole year average
plot(dailyMeans,'-o')
line([359 359],ylim)