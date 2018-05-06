import httplib, urllib, base64

headers = {
    # Request headers
    'Content-Type': 'application/json',
    'Ocp-Apim-Subscription-Key': '8cb633cbd35c46899ccda26667370ba0',
}

params = urllib.urlencode({
})

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

try:
    conn = httplib.HTTPSConnection('eastus.api.cognitive.microsoft.com')
    conn.request("POST", "/text/analytics/v2.0/sentiment?%s" % params, input, headers)
    response = conn.getresponse()
    data = response.read()
    print(data)
    conn.close()
except Exception as e:
    print("[Errno {0}] {1}".format(e.errno, e.strerror))
