%Merge scores and errors into the reddit table
%var scores = scores.csv, ditto errors

% %sort 
% reddit = readtable('2014_step1.csv');
% [~,b] = sort(reddit.id);
% reddit = reddit(b,:);
% 
% [~,b] = sort(scores.ID);
% scores = scores(b,:);
% 
% [~,b] = sort(errors.ID);
% errors = errors(b,:);
% 
% %add new columns to reddit
% Score = table(zeros(size(reddit,1),1));
% Error = table(cell(size(reddit,1),1));

ids = scores.id;ids = cellstr(ids);
scores.id = ids;

reddit = outerjoin(reddit,scores);

errors.Properties.VariableNames{1} = 'id';
ids = errors.id;ids = cellstr(ids);
errors.id = ids;

reddit = outerjoin(reddit,errors);