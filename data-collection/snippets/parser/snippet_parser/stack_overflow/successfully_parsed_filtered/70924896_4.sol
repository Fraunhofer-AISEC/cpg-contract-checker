    constructor(uint256 _initialSupply) payable {
            balanceOf[msg.sender] = _initialSupply;
            totalSupply = _initialSupply;
    }
    
