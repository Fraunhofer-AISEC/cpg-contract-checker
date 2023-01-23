   function getAccountDetails() view public returns(uint, address, bytes32[] memory, bytes32[] memory) {
        return (addressAccountHash[msg.sender].id, addressAccountHash[msg.sender].account, addressAccountHash[msg.sender].animals, addressAccountHash[msg.sender].items);
    }
