% plot sentiment relative to game
% vars: NBA, reddit
% Note: NBA has LAC, LAL, BKN, NYK (do not unique that)

% Cities/Teams
cities = unique(reddit.subreddit);

% Loop through the games
for i=1:size(NBA,1)
    
