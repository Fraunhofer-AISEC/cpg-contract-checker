 function addUser(string calldata _name, uint256 _hash) external{
        require(_hash == uint256(keccak256(abi.encodePacked(secretkey, nonce))));
        lastfmAuth[_name] = msg.sender;
        nonce++;
 }
