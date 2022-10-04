    function someFunction(
            uint256 initialSupply,
            string memory contractName,
            string memory tokenSymbol,
            uint256 contractHoldTime,
            uint256 contractHoldMax,
            uint256 contractMaxSupply,
            address contractOwner


        ) public {

        totalSupply = initialSupply; 
        name = contractName;            
        symbol = tokenSymbol;        
        holdTime = contractHoldTime;
        holdMax = contractHoldMax;
        maxSupply = contractMaxSupply;
        owner = contractOwner; 
        balanceOf[contractOwner] = balanceOf[contractOwner].add(totalSupply);
        }
