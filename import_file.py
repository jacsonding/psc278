import csv
import pdb
#Read all the lines
lines = []
with open('2014_step1.csv','rb') as csvfile:
    spamreader = csv.reader(csvfile)
    for row in spamreader:
        lines.append(row)

#Delete first line (headers)
lines.pop()

#Batch in 1000
for i in range(0,len(lines),1000):
    #Open output file 'a'
    outputFile = open('output.csv','ab')

    endNum = 1000
    if ((len(lines)-i)<endNum):
        endNum = len(lines)-i

    for j in range(0,endNum):
        outputFile.write(lines[i+j][0]+lines[i+j][5]) #body and id
    outputFile.close()
    print("Up to: "+str(i+j))
