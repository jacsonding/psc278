%
cities = unique(reddit.subreddit);
dayTime = 86400;

% New Table 
x = sortrows(reddit,2);
ClosestGame = array2table(zeros(size(x,1),1),'VariableNames',{'ClosestGame'});
RelativeTime = array2table(zeros(size(x,1),1),'VariableNames',{'RelativeTime'});
Condition = cell2table(cell(size(x,1),1),'VariableNames',{'Condition'});
x = [x ClosestGame RelativeTime Condition];

for i=1:size(x,1)
    eligibleGames = (NBA.UTC>(x.created_utc(i)-dayTime) & NBA.UTC<(x.created_utc(i)+dayTime));
end

% for i=1:size(cities,1)
%     %All eligible NBA games
%     visitingL = strcmpi(NBA.VisitorNeutral,cities{i});
%     homeL = strcmpi(NBA.HomeNeutral,cities{i});
%     
%     visitorWins = (NBA.PTS>NBA.PTS1);
%     
%     % Loop through all eligible games
%     jindex = find(visitingL | homeL);
%     for m = 1:length(jindex)
%         j = jindex(m);
%         gameUTC = NBA.UTC(j);
%         
%         % Loop through all comments within a day
%         startTime = gameUTC-dayTime;
%         endTime = gameUTC+dayTime;
%         
%         
%         kindex = find(x.created_utc>startTime & x.created_utc<endTime);
%         for n=1:length(kindex)
%             k = kindex(n);
%             x.ClosestGame(k) = gameUTC;
%             x.RelativeTime(k) = x.created_utc(k)-gameUTC;
%             
%             if(visitorWins(j) && visitingL(j))
%                 x.Condition{k} = 'W';
%             elseif(visitorWins(j) && homeL(j))
%                 x.Condition{k} = 'L';
%             elseif(~visitorWins(j) && visitingL(j))
%                 x.Condition{k} = 'L';
%             elseif(~visitorWins(j) && homeL(L))
%                 x.Condition{k} = 'W';
%             end
%         end
%         disp('woo')
%     end
%     disp('waka')
% end