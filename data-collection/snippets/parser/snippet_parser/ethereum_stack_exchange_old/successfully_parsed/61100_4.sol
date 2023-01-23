contract IPFSStorage {
    event CIDStoredInTheLog(string _hash);

    function storeCIDInTheLog(string _hash) public {

        emit CIDStoredInTheLog(_hash);
    }
}
