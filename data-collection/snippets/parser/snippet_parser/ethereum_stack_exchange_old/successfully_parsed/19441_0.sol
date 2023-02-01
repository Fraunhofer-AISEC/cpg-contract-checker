function getData(string Key) constant returns (string[], string[]) {

    uint length = data.length;

    string[] memory key = new string[](length);
    string[] memory hash = new string[](length);

    for(uint i=0; i < data.length; i++ ) {
        Data memory currentData;
        currentData = data[i];

        key[i] = currentData.key;
        hash[i] = currentData.hash;
    }

    return (key,hash);
}
