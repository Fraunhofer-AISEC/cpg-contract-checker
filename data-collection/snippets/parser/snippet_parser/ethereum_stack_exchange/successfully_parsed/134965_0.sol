    mapping(address => bool) public isInTaxMap;
    mapping(address => string) private taxRecipientName;
    mapping(address => uint256) private taxRecipientRate;
    address[] private taxKeys; 

    function taxRateAdd(address recipientAddress, string memory recipientName, uint256 recipientTaxRate) onlyOwner public returns (bool){     
        taxRecipientName[recipientAddress] = recipientName;
        taxRecipientRate[recipientAddress] = recipientTaxRate;
        if(!isInTaxMap[recipientAddress]) {
            isInTaxMap[recipientAddress] = true;
            taxKeys.push(recipientAddress);
        }
        return true;
    }

    function taxRateDelete(address recipientAddress) onlyOwner public returns (bool){
        if(!isInTaxMap[recipientAddress]) {
            delete taxRecipientName[recipientAddress];
            delete taxRecipientRate[recipientAddress];
            delete isInTaxMap[recipientAddress];  
            return true;      
        }
        return false;
    }    

    function taxRateCount() public view returns (uint256){
        return taxKeys.length;
    }

    function taxRateRecipients() public view returns(address[] memory){
        return taxKeys;
    }

    function taxRateTotal() public view returns (uint256){
        uint256 recipientTaxRate = 0;
        for(uint i; i < taxKeys.length; ++i){
            recipientTaxRate = recipientTaxRate + taxRecipientRate[taxKeys[i]];
        }
        return recipientTaxRate;
    }
