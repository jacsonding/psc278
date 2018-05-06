import httplib, urllib, base64
import csv
import pdb
import json

def requestChunk(input):
    headers = {
        # Request headers
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key': '8cb633cbd35c46899ccda26667370ba0',
    }

    params = urllib.urlencode({
    })

    try:
        conn = httplib.HTTPSConnection('eastus.api.cognitive.microsoft.com')
        conn.request("POST", "/text/analytics/v2.0/sentiment?%s" % params, input, headers)
        response = conn.getresponse()
        data = response.read()
        conn.close()
        return data
    except Exception as e:
        print("[Errno {0}] {1}".format(e.errno, e.strerror))

#Read all the lines
lines = []
with open('2014_step1.csv','rb') as csvfile:
    spamreader = csv.reader(csvfile)
    for row in spamreader:
        lines.append(row)

#Delete first line (headers)
lines.pop()

#Create / Overwrite file
f = open('batch.output','w+')
f.close()

#Batch in 1000
for i in range(0,len(lines),1000):
    #Open output file 'a'
    outputFile = open('batch.output','ab')

    endNum = 1000
    if ((len(lines)-i)<endNum):
        endNum = len(lines)-i

    # Create list of current 1000
    jsonString = "{ \"documents\": ["
    for j in range(0,endNum):
        id = lines[i+j][5]
        body = lines[i+j][0]
        currDict = { "language":"en", "id":id, "text":body}
        currString = json.dumps(currDict)
        jsonString += currString +","
        # outputFile.write(lines[i+j][0]+lines[i+j][5]) #body and i
    jsonString = jsonString[:-1]
    jsonString += "]}"
    # Create dictionary

    response = ""
    response = requestChunk(jsonString) ############REQUEST############
    outputFile.write(response)
    outputFile.close()
    print("Up to: "+str(i+j))
    break
