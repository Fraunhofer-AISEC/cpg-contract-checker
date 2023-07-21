  function convert(bytes memory data) public pure returns (string memory) {
        return abi.decode(data,(string));
    }
