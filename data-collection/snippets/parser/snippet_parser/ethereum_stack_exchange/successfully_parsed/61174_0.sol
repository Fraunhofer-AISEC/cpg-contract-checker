    function HashUtility(bytes32 val) public pure returns (bytes32) {
        bytes32 h = sha256(abi.encodePacked(val));
        return h;
    }
