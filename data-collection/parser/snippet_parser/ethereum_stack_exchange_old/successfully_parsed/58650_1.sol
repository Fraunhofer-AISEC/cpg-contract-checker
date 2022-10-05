uint256 newMaxPositionForAddress = emoji[msg.sender].push(Token(_token, _ipfsHash));
addressToLastUsedPostion[msg.sender] = newMaxPositionForAddress;
