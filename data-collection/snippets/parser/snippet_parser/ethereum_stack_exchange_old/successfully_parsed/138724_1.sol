bytes32 hash = keccak256(abi.encodePacked(address(this), block.chainid)); 
bytes32 message = keccak256(abi.encodePacked("Hello, this is Bob. I am verifying ownership of your wallet.", "", "", "Hash: ", hash)).toEthSignedMessageHash();

require(message.recover(signatures[i]) == account, _errorMsg("INVALID_SIGNATURE", account));
