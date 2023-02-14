bytes memory _queryData = abi.encode("TwitterContestV1", abi.encode(bytes("")));
bytes32 _queryId = keccak256(_queryData);
