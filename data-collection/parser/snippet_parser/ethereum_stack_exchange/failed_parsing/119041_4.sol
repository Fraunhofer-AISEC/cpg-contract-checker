...
    event ContractCreated(address newTokenAddress);

    function create(string memory _uri) public {
        newToken addr=new newToken(_uri,msg.sender);
        contractAddress.push(addr);
        contracts[msg.sender]=addr;
        emit ContractCreated(address(newToken));
    }
