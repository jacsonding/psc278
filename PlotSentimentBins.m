% Plot per hour averages
daySeconds = 24*60*60;

meanSentiment = [];
nSentiment = [];

for i=-24:23
    startTime = i*3600;
    endTime = (i+1)*3600;
    meanSentiment(i+24+1) = mean(x.Scaled(x.RelativeTimeW>startTime & x.RelativeTimeW<endTime,:));
%     nSentiment(i+24+1) = sum(x.RelativeTimeW>startTime & x.RelativeTimeW<endTime);
    nSentiment(i+24+1) = std(x.Scaled(x.RelativeTimeW>startTime & x.RelativeTimeW<endTime,:));
end