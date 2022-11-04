contract OwnedStorage is DSAuth {
    string public data;

    function setData(string newData) public auth {
        data = newData;
    }
}