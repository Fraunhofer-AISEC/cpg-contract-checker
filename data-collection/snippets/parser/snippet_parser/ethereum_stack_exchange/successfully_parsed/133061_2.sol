    function hash(string calldata data) public pure returns(bytes32){
        return keccak256(abi.encodePacked(data));
    }
