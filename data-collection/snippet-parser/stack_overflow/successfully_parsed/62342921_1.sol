    function createRequest(string memory _fileHash) public {
        requestCount++;
        fileHash[requestCount] = _fileHash;
        emit RequestCreated(requestCount);
    }
