url_1 = "json(https://opensky-network.org/api/states/all?icao24";
url_2 = id;
url_3 = ")states[0][0]"

bytes memory burl_1 = bytes(url_1);
bytes memory burl_2 = bytes(url_2);
bytes memory burl_3 = bytes(url_3);

string memory url = string(burl_1.length + burl_2.length + burl_3.length);
bytes memory burl = bytes(url);

uint k = 0;
for (uint i = 0; i < burl_1.length; i++) burl[k++] = burl_1[i];
for (i = 0; i < burl_2.length; i++) burl[k++] = burl_2[i];
for (i = 0; i < burl_3.length; i++) burl[k++] = burl_3[i];

url = string(burl);
