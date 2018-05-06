import http.client, urllib.request, urllib.parse, urllib.error, base64

def requestChunk(input):
    headers = {
        # Request headers
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key': '8cb633cbd35c46899ccda26667370ba0',
    }

    params = urllib.parse.urlencode({
    })

    try:
        conn = http.client.HTTPSConnection('eastus.api.cognitive.microsoft.com')
        conn.request("POST", "/text/analytics/v2.0/sentiment?%s" % params, input, headers)
        response = conn.getresponse()
        data = response.read()
        conn.close()
        return data
    except Exception as e:
        #################TRACK!!!!!!!!!!!!#########
        print("[Errno {0}] {1}".format(e.errno, e.strerror))

input = "{ \
 \"documents\": [ \
    {\
      \"language\": \"en\",\
      \"id\": \"1\",\
      \"text\": \"Hello world. This is some input text that I love.\"\
    },\
    {\
      \"language\": \"fr\",\
      \"id\": \"2\",\
      \"text\": \"Bonjour tout le monde\"\
    },\
  ]\
}"

a = requestChunk(input)
print(a)
