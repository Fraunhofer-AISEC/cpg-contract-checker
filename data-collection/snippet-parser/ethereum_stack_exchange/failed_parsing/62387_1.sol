places = [{"placeid": 0, "nameofplace": "home"}, {"placeid":1, "nameofplace": "center"}]

banners = [
{"bannerid": 0, "placeAt": 0, "thingthebannersays": "hello!"},
{"bannerid": 1, "placeAt": 0, "thingthebannersays": "hello again from home!"},
{"bannerid": 2, "placeAt": 0, "thingthebannersays": "this replaces 1!"},
{"bannerid": 3, "placeAt": 1, "thingthebannersays": "this is at center!"}]

bannerAtPlaces = [(0,2), #place 0 has current banner 2
                  (1,3)  #place 1 has banner 3
]

def setBannerAtPlaces(placeid, bannerid):
  # this updates bannerAtPlaces according to some rules
  # such as the most-recent timestamp given in the solidity
  # section

# BUT If I wanted to see which places contained which banners, I'd just
# print(bannerAtPlaces).  This is the call I'm looking to repeat
# in solidity.
