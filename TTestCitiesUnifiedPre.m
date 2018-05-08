% TTest Cities and Whole Dataset 4-ways

% % % % Sentiment Weighing % % % %
% log
% x.Scaled = x.Sentiment.*log(x.score-min(x.score)+1);
% sqrt
% x.Scaled = x.Sentiment.*sqrt(x.score-min(x.score));
% linear
% x.Scaled = ((x.score-min(x.score))/(max(x.score)-min(x.score)));


% Create lists
thisCity = cell(27,1);
thisWWp = zeros(27,1);
thisLLp = zeros(26,1);
thisWL = zeros(26,1);
thisWpLp = zeros(26,1);

thisWWp_h = zeros(27,1);
thisLLp_h = zeros(26,1);
thisWL_h = zeros(26,1);
thisWpLp_h = zeros(26,1);

% TTest Cities
for i=1:26
    % p-values
    thisCity{i} = CITIES{i}; %city name
    [h,p] = ttest2(x.Scaled((x.RelativeTimeW<0 | x.RelativeTimeL<0) & x.City==i),x.Scaled(x.RelativeTimeW>0 & x.City==i)); %pre vs post-win
    thisWWp(i) = p;
    thisWWp_h(i) = h;
    [h,p] = ttest2(x.Scaled((x.RelativeTimeW<0 | x.RelativeTimeL<0) & x.City==i),x.Scaled(x.RelativeTimeL>0 & x.City==i)); %pre vs post-loss
    thisLLp(i) = p;
    thisLLp_h(i) = h;
    [h,p] = ttest2(x.Scaled((x.RelativeTimeW<0 | x.RelativeTimeL<0) & x.City==i),x.Scaled((x.RelativeTimeW>0 | x.RelativeTimeL>0) & x.City==i)); %pre vs post
    thisWL(i) = p;
    thisWL_h(i) = h;
    [h,p] = ttest2(x.Scaled(x.RelativeTimeL>0 & x.City==i),x.Scaled(x.RelativeTimeW>0 & x.City==i)); %post-loss vs post-win
    thisWpLp(i) = p;
    thisWpLp_h(i) = h;
end

% TTest Whole
i=27;
thisCity{i} = 'Whole Dataset';
[h,p] = ttest2(x.Scaled((x.RelativeTimeW<0 | x.RelativeTimeL<0)),x.Scaled(x.RelativeTimeW>0)); %pre vs post-win
thisWWp(i) = p;
thisWWp_h(i) = h;
[h,p] = ttest2(x.Scaled((x.RelativeTimeW<0 | x.RelativeTimeL<0)),x.Scaled(x.RelativeTimeL>0)); %pre vs post-loss
thisLLp(i) = p;
thisLLp_h(i) = h;
[h,p] = ttest2(x.Scaled((x.RelativeTimeW<0 | x.RelativeTimeL<0)),x.Scaled((x.RelativeTimeW>0 | x.RelativeTimeL>0))); %pre vs post
thisWL(i) = p;
thisWL_h(i) = h;
[h,p] = ttest2(x.Scaled(x.RelativeTimeL>0),x.Scaled(x.RelativeTimeW>0)); %post-loss vs post-win
thisWpLp(i) = p;
thisWpLp_h(i) = h;

% Create Table
StatResults = table(thisCity,thisWWp,thisLLp,thisWL,thisWpLp,...
    'VariableNames',...
    {'City','Pre_vs_Post_Win','Pre_vs_Post_Loss','Pre_vs_Post','Post_Loss_vs_Post_Win'});
StatResultsH = table(thisCity,thisWWp_h,thisLLp_h,thisWL_h,thisWpLp_h,...
    'VariableNames',...
    {'City','Pre_vs_Post_Win','Pre_vs_Post_Loss','Pre_vs_Post','Post_Loss_vs_Post_Win'});
% 
sum(StatResultsH.Pre_vs_Post_Win)
sum(StatResultsH.Pre_vs_Post_Loss)
sum(StatResultsH.Pre_vs_Post)
sum(StatResultsH.Post_Loss_vs_Post_Win)
