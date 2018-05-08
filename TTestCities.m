% TTest Cities and Whole Dataset 4-ways

% % % % Sentiment Weighing % % % %
% log
% x.Scaled = x.Sentiment.*log(x.score-min(x.score)+1);
% sqrt
% x.Scaled = x.Sentiment.*sqrt(x.score-min(x.score));
% linear
% x.Scaled = x.Sentiment.*((x.score-min(x.score))/(max(x.score)-min(x.score)));


% Create lists
thisCity = cell(27,1);
thisWWp = zeros(27,1);
thisLLp = zeros(27,1);
thisWL = zeros(27,1);
thisWpLp = zeros(27,1);

thisWWp_h = zeros(27,1);
thisLLp_h = zeros(27,1);
thisWL_h = zeros(27,1);
thisWpLp_h = zeros(27,1);

thisWWp_n = zeros(27,1);
thisLLp_n = zeros(27,1);
thisWL_n = zeros(27,1);
thisWpLp_n = zeros(27,1);

% TTest Cities
for i=1:26
    % p-values
    thisCity{i} = CITIES{i}; %city name
    [h,p] = ttest2(x.Scaled(x.RelativeTimeW<0 & x.City==i),x.Scaled(x.RelativeTimeW>0 & x.City==i)); %pre-win vs post-win
    thisWWp(i) = p;
    thisWWp_n(i)= sum(x.RelativeTimeW<0 & x.City==i);
    thisWWp_h(i) = h;
    [h,p] = ttest2(x.Scaled(x.RelativeTimeL<0 & x.City==i),x.Scaled(x.RelativeTimeL>0 & x.City==i)); %pre-loss vs post-loss
    thisLLp(i) = p;
    thisLLp_n(i)= sum(x.RelativeTimeL<0 & x.City==i);
    thisLLp_h(i) = h;
    [h,p] = ttest2(x.Scaled(x.RelativeTimeL<0 & x.City==i),x.Scaled(x.RelativeTimeW<0 & x.City==i)); %pre-loss vs pre-win
    thisWL(i) = p;
    thisWL_n(i)= sum(x.RelativeTimeL<0 & x.City==i);
    thisWL_h(i) = h;
    [h,p] = ttest2(x.Scaled(x.RelativeTimeL>0 & x.City==i),x.Scaled(x.RelativeTimeW>0 & x.City==i)); %post-loss vs post-win
    thisWpLp(i) = p;
    thisWpLp_n(i)= sum(x.RelativeTimeL>0 & x.City==i);
    thisWpLp_h(i) = h;
end

% TTest Whole
i=27;
thisCity{i} = 'Whole Dataset';
[h,p] = ttest2(x.Scaled(x.RelativeTimeW<0),x.Scaled(x.RelativeTimeW>0)); %pre-win vs post-win
thisWWp_n(i) = sum(x.RelativeTimeW<0);
thisWWp(i) = p;
thisWWp_h(i) = h;
[h,p] = ttest2(x.Scaled(x.RelativeTimeL<0),x.Scaled(x.RelativeTimeL>0)); %pre-loss vs post-loss
thisLLp_n(i) = sum(x.RelativeTimeL<0);
thisLLp(i) = p;
thisLLp_h(i) = h;
[h,p] = ttest2(x.Scaled(x.RelativeTimeL<0),x.Scaled(x.RelativeTimeW<0)); %pre-loss vs pre-win
thisWL_n(i) = sum(x.RelativeTimeL<0);
thisWL(i) = p;
thisWL_h(i) = h;
[h,p] = ttest2(x.Scaled(x.RelativeTimeL>0),x.Scaled(x.RelativeTimeW>0)); %post-loss vs post-win
thisWpLp_n(i) = sum(x.RelativeTimeL>0);
thisWpLp(i) = p;
thisWpLp_h(i) = h;

% Create Table
StatResults = table(thisCity,thisWWp,thisLLp,thisWL,thisWpLp,...
    'VariableNames',...
    {'City','Pre_Win_vs_Post_Win','Pre_Loss_vs_Post_Loss','Pre_Loss_vs_Pre_Win','Post_Loss_vs_Post_Win'});
StatResultsH = table(thisCity,thisWWp_n,thisLLp_n,thisWL_n,thisWpLp_n,...
    'VariableNames',...
    {'City','Pre_Win_vs_Post_Win','Pre_Loss_vs_Post_Loss','Pre_Loss_vs_Pre_Win','Post_Loss_vs_Post_Win'});
%
% sum(StatResultsH.Pre_Win_vs_Post_Win)
% sum(StatResultsH.Pre_Loss_vs_Post_Loss)
% sum(StatResultsH.Pre_Loss_vs_Pre_Win)
% sum(StatResultsH.Post_Loss_vs_Post_Win)
