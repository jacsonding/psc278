#Purpose: to unify the hacky json files in the output
import json
import pdb

f = open('batch.output')
lines = f.readlines()
f.close()

scoreDict = {} #id : score
errorDict = {} #id : error
for batch in lines:
    scores = json.loads(batch)['documents']
    errors = json.loads(batch)['errors']
    for row in scores:
        id = row['id']
        score = row['score']
        scoreDict[id] = score
    for row in errors:
        id = row['id']
        error = ['message']
        errorDict[id] = error

pdb.set_trace()
scoreDict = json.dumps(scoreDict)
f = open('scores.json','w+')
f.write(scoreDict)
f.close()

errorDict = json.dumps(errorDict)
f = open('errors.json','w+')
f.write(errorDict)
f.close()
