% plot sentiment relative to game
% vars: NBA, x
% Note: NBA has LAC, LAL, BKN, NYK (do not unique that)

% Cities/Teams
cities = unique(x.subreddit);

% Want to find the nearest game AND the difference in time AND condition
%% Create x table and new columns
x = sortrows(reddit,2);
ClosestGame = array2table(zeros(size(x,1),1),'VariableNames',{'ClosestGame'});
RelativeTime = array2table(zeros(size(x,1),1),'VariableNames',{'RelativeTime'});
Condition = cell2table(cell(size(x,1),1),'VariableNames',{'Condition'});
x = [x ClosestGame RelativeTime Condition];


%% For loop
% Loop through the games
for i=1:size(x,1)
    thisCity = x.subreddit{i};
    
    currMin = realmax;
    currGame = 0;
    currCondition = 'null';
    
    % Find eligible games
    visitingL = strcmpi(NBA.VisitorNeutral,thisCity);
    homeL = strcmpi(NBA.HomeNeutral,thisCity);
    
    allGames = find(visitingL | homeL);
    visitingGames = find(visitingL);
    homeGames = find(homeL);
    
    jindex = allGames;
    for m=1:length(allGames)
        j = jindex(m);
        if xor(visitingL(j),homeL(j))
            %Check to see if game is closer
            if abs(NBA.UTC(j)-x.created_utc(i)) < abs(currMin)
                currMin = x.created_utc(i)-NBA.UTC(j);
                currGame = NBA.UTC(j);
                
                % if we win
                if (visitingL(j) & (NBA.PTS(j) > NBA.PTS1(j)))
                    currCondition = 'W';
                else
                    currCondition = 'L';
                end
                
                if (homeL(j) & (NBA.PTS(j) > NBA.PTS1(j)))
                    currCondition = 'L';
                else
                    currCondition = 'W';
                end
                
            end
        end
    end
    
    % Add the information
    x.ClosestGame(i) = currGame;
    x.RelativeTime(i) = currMin;
    x.Condition{i} = currCondition;
   
    if mod(i,100000)==0
        disp(i)
    end
end
