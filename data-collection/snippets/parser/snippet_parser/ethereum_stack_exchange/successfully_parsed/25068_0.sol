function myFunc(address _contractAddress, address _user, uint _price) onlyOwner {
        

        require(_contractAddress.call(bytes4(sha3("func(address, uint256)")), _user, _price));

        
    }
