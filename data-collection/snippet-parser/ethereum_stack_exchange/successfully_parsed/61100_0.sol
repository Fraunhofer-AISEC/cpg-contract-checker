contract IPFSStorage {
    string hash;
    function storeCIDAsString(string _hash) public {
        hash = _hash;
    }
}
