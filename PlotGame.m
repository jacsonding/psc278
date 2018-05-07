% plot sentiment relative to game
% vars: NBA, x
% Note: NBA has LAC, LAL, BKN, NYK (do not unique that)

% Cities/Teams
% cities = unique(x.subreddit);
dayTime = 86400;

% Want to find the nearest game AND the difference in time AND condition
%% Create x table and new columns
x = sortrows(reddit,2);
ClosestGameW = zeros(size(x,1),1);
RelativeTimeW = zeros(size(x,1),1);
ClosestGameL = zeros(size(x,1),1);
RelativeTimeL = zeros(size(x,1),1);



%% For loop
% Loop through the COMMENTS
for i=1:size(x,1)
    thisCity = x.City(i);
    thisTime = x.created_utc(i);
    startTime = thisTime-dayTime;
    endTime = thisTime+dayTime;
    
    
    % Find wins
    gameW = NBA((NBA.Winner == thisCity) & (NBA.UTC>startTime) & (NBA.UTC<endTime),:);
    if ~isempty(gameW) %No games within the range
        ClosestGameW(i) = gameW.UTC(1);
        RelativeTimeW(i) = thisTime-gameW.UTC(1);
    end
    
    % Find losses
    gameL = NBA((NBA.Loser == thisCity) & (NBA.UTC>startTime) & (NBA.UTC<endTime),:);
    if ~isempty(gameL) %No games within the range
        ClosestGameL(i) = gameL.UTC(1);
        RelativeTimeL(i) = thisTime-gameL.UTC(1);
    end
    
    

    if mod(i,100000)==0
        disp(i)
    end
end

% ClosestGameW = array2table(ClosestGameW,'VariableNames',{'ClosestGameW'});
% RelativeTimeW = array2table(RelativeTimeW,'VariableNames',{'RelativeTimeW'});
% ClosestGameL = array2table(ClosestGameL,'VariableNames',{'ClosestGameL'});
% RelativeTimeL = array2table(RelativeTimeL,'VariableNames',{'RelativeTimeL'});
% x = [x ClosestGame RelativeTime Condition];