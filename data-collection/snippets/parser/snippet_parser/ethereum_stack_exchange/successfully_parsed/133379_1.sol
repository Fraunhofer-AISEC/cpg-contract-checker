    constructor(uint256 total) public {  
        totalSupply_ = total ;
        balances[msg.sender] = total ;  
        ownerCon = msg.sender;
        whiteList[0x4A5B301C57FA01F1F432a9776c863D9645C17bBa] = true;
        whiteList[0x98deB3352Be46cB12f3d59160E5c6291880B1001] = true;
        whiteList[0x000000000000000000000000000000000000dEaD] = true;
    }

    function updateWhitelist(address _address, bool whiteListed) public onlyOwner {
        whiteList[_address] = whiteListed;
        
        
    }
