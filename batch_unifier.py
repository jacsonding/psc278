#Purpose: to unify the hacky json files in the output
import json
import pdb
import csv

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
        error = row['message']
        errorDict[id] = "["+error+"]"

f = open('scores.csv','w+')
writer = csv.writer(f)
for key, value in scoreDict.items():
    writer.writerow([key, value])
f.close()

f = open('errors.csv','w+')
writer = csv.writer(f)
for key, value in errorDict.items():
    writer.writerow([key, value])
f.close()
