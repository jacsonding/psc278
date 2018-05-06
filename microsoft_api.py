import httplib, urllib, base64

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

### Open file
input = "{ \
 \"documents\": [ \
    {\
      \"language\": \"en\",\
      \"id\": \"1\",\
      \"text\": \"Ironically, this is the first keytar bear post I've ever upvoted. ^^^^^I ^^^^^do ^^^^^hope ^^^^^he's ^^^^^OK\"\
    },\
    {\
      \"language\": \"en\",\
      \"id\": \"2\",\
      \"text\": \"I am a fan of Blur and of many things Damon Albarn has done, I even own [the Ravenous movie score](http://www.youtube.com/watch?v=e1s5jUg1Ytc) on CD, actual plastic. Really though, if you like Blur watch [No Distance Left To Run](http://vimeo.com/27945831) if you haven't already. But I never want to hear Song 2 ever again.\"\
    },\
    {\"language\":\"en\",\"id\":\"a\",\"text\":\"I am a fan of Blur and of many things Damon Albarn has done, I even own [the Ravenous movie score](http://www.youtube.com/watch?v=e1s5jUg1Ytc) on CD, actual plastic. Really though, if you like Blur watch [No Distance Left To Run](http://vimeo.com/27945831) if you haven't already. But I never want to hear Song 2 ever again.\"\
    },\
  ]\
}"

a = requestChunk(input)
print(a)
