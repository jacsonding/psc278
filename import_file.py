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

    # Create list of current 1000
    body_list = []
    id_list = []
    for j in range(0,endNum):
        body_list.append(lines[i+j][0])
        id_list.append(lines[i+j][5])
        # outputFile.write(lines[i+j][0]+lines[i+j][5]) #body and i

    # Create dictionary
    batch_dict = {}
    for j in range(len(id_list)):
        batch_dict[id_list[j]] = body_list[j]
    pdb.set_trace()

    outputFile.close()
    print("Up to: "+str(i+j))
