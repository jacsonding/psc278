% Actually plot game

thisCity = cell(27,1);
thisWWp = zeros(27,1);
thisLLp = zeros(26,1);
thisWL = zeros(26,1);
thisWpLp = zeros(26,1);

for i=1:26
    thisCity{i} = CITIES{i}; %city name
    [h,p] = ttest2(x.Scaled(x.RelativeTimeW<0 & x.City==i),x.Scaled(x.RelativeTimeW>0 & x.City==i)); %pre-win vs post-win
    thisWWp(i) = p;
    [h,p] = ttest2(x.Scaled(x.RelativeTimeL<0 & x.City==i),x.Scaled(x.RelativeTimeL>0 & x.City==i)); %pre-loss vs post-loss
    thisLLp(i) = p;
    [h,p] = ttest2(x.Scaled(x.RelativeTimeL<0 & x.City==i),x.Scaled(x.RelativeTimeW<0 & x.City==i)); %pre-loss vs pre-win
    thisWL(i) = p;
    [h,p] = ttest2(x.Scaled(x.RelativeTimeL>0 & x.City==i),x.Scaled(x.RelativeTimeW>0 & x.City==i)); %post-loss vs post-win
    thisWpLp(i) = p;
end

i=27;
thisCity{i} = 'Whole Dataset';
[h,p] = ttest2(x.Scaled(x.RelativeTimeW<0),x.Scaled(x.RelativeTimeW>0)); %pre-win vs post-win
thisWWp(i) = p;
[h,p] = ttest2(x.Scaled(x.RelativeTimeL<0),x.Scaled(x.RelativeTimeL>0)); %pre-loss vs post-loss
thisLLp(i) = p;
[h,p] = ttest2(x.Scaled(x.RelativeTimeL<0),x.Scaled(x.RelativeTimeW<0)); %pre-loss vs pre-win
thisWL(i) = p;
[h,p] = ttest2(x.Scaled(x.RelativeTimeL>0),x.Scaled(x.RelativeTimeW>0)); %post-loss vs post-win
thisWpLp(i) = p;

StatResults = table(thisCity,thisWWp,thisLLp,thisWL,thisWpLp,...
    'VariableNames',...
    {'City','Pre_Win_vs_Post_Win','Pre_Loss_vs_Post_Loss','Pre_Loss_vs_Pre_Win','Post_Loss_vs_Post_Win'});