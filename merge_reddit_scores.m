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

%% IMPORT FILES
% reddit = readtable('2014_step1.csv');
% errors = readtable('errors.csv');
% scores = readtable('scores.csv');

%% Merge

scores.Properties.VariableNames{1} = 'id';
ids = scores.id;ids = cellstr(ids);
scores.id = ids;

reddit = outerjoin(reddit,scores);

reddit.Properties.VariableNames{6} = 'id';
reddit(:,'id_scores') = [];

errors.Properties.VariableNames{1} = 'id';
ids = errors.id;ids = cellstr(ids);
errors.id = ids;

reddit = outerjoin(reddit,errors);

reddit(:,'id_errors') = [];
reddit.Properties.VariableNames{8} = 'Sentiment';