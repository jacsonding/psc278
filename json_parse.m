%json response parser

% data = table
% response1 = response
% response1 = loadjson('batch.output')

lengthOfResponse = size(response1{1,1}.documents,2);
scores = zeros(1,lengthOfResponse);
ids = cell([1 lengthOfResponse]);

for i=1:lengthOfResponse
    scores(i)= response1.documents{i}.score;
    ids{i} = response1.documents{i}.id; 
end

setdiff(ids,data.id(1:lengthOfResponse))
setdiff(data.id(1:lengthOfResponse),ids)