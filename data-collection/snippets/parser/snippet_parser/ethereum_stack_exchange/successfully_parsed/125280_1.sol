    function getNameOfContractPreSaleOne(string calldata name) public view returns (string memory){
        ERC721 _token = preSaleOneTokenMap[name]._contractObj;
        return _token.name();
    }  
