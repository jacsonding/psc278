% plot sentiment relative to game
% vars: NBA, reddit
% Note: NBA has LAC, LAL, BKN, NYK (do not unique that)

% Cities/Teams
cities = unique(reddit.subreddit);

% Want to find the nearest game AND the difference in time AND condition

% Loop through the games
ClosestGame = [];
RelativeTime = [];
Condition = {};
for i=1:size(reddit,1)
    thisCity = reddit.subreddit{i};
    
    currMin = realmax;
    currGame = 0;
    currCondition = 'null';
    
    % Find eligible games
    visitingL = strcmpi(NBA.VisitorNeutral,thisCity);
    homeL = strcmpi(NBA.HomeNeutral,thisCity);
    
    allGames = find(visitingL | homeL);
    visitingGames = find(visitingL);
    homeGames = find(homeL);
    
    for j=1:allGames      
        if xor(visitingGames(j),homeGames(j))
            %Check to see if game is closer
            if abs(NBA.UTC(j)-reddit.created_utc(i)) < abs(currMin)
                currMin = reddit.created_utc(i)-NBA.UTC(j);
                currGame = NBA.UTC(j);
                
                % if we win
                if (visitingGames(j) & (NBA.PTS(j) > NBA.PTS1(j)))
                    currCondition = 'W';
                else
                    currCondition = 'L';
                end
                
                if (homeGames(j) & (NBA.PTS(j) > NBA.PTS1(j)))
                    currCondition = 'L';
                else
                    currCondition = 'W';
                end
                
            end
        end
    end
    
    % Add the information
    ClosestGame = [ClosestGame; currGame];
    RelativeTime = [RelativeTime; currMin];
    Condition = [Condition; currCondition];
    
    if mod(i,100000)==0
        disp(i)
    end
end
