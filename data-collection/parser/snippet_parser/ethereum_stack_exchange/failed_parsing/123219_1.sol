function mint(uint numberOfTokens) public payable {     <——— *******Has 1 arguments
        uint256 ts = totalSupply();
        require(saleIsActive, "Sale must be active to mint tokens");
        require(numberOfTokens <= MAX_PUBLIC_MINT, "Exceeded max token purchase");
        require(ts + numberOfTokens <= MAX_SUPPLY, "Purchase would exceed max tokens");
    
        require(MINT_PRICE.mul(numberOfTokens) <= msg.value, "Ether value sent is not correct");

        for (uint i = 0; i < numberOfTokens; i++) {
             uint mintIndex = totalSupply(); 
            if (totalSupply() < MAX_SUPPLY) {
            _safeMint(msg.sender, mintIndex);
         
           }
        }
