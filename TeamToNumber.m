% Add numbers to NBA teams and reddit datascities = unique(reddit.subreddit);
cities = [cities;     "Brooklyn Nets";
    "Los Angeles Clippers";
    "Los Angeles Lakers";
    "New York Knicks"];

% NBA_Winners = zeros(size(NBA,1),1);
% NBA_Losers = zeros(size(NBA,1),1);
% for i=1:size(NBA,1)
%     if NBA.PTS(i)>NBA.PTS1(i) %visitor won
%         NBA_Winners(i) = find(ismember(lower(cities),lower(NBA.VisitorNeutral{i})));
%         NBA_Losers(i) = find(ismember(lower(cities),lower(NBA.HomeNeutral{i})));
%     else %home won
%         NBA_Losers(i) = find(ismember(lower(cities),lower(NBA.VisitorNeutral{i})));
%         NBA_Winners(i) = find(ismember(lower(cities),lower(NBA.HomeNeutral{i})));
%     end
% end
% NBA_Winners = array2table(NBA_Winners,'VariableNames',{'Winner'});
% NBA_Losers = array2table(NBA_Losers,'VariableNames',{'Loser'});
% 
% NBA = [NBA NBA_Winners NBA_Losers];

reddit_team = zeros(size(reddit,1),1);

for i=1:size(reddit,1)
    reddit_team(i)=find(ismember(lower(cities),lower(reddit.subreddit{i})));
    if mod(i,100000)==0
        disp(i)
    end
end