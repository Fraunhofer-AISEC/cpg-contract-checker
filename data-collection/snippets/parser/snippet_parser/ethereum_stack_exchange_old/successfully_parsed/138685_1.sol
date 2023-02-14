contract OwnedStorage is Owned {
    string public data;

    function setData(string newData) public only_owner {
        data = newData;
    }
}
