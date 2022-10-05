contract OwnedToken {
    
    
    
    TokenCreator creator;
    address owner;
    bytes32 name;

    
    
    constructor(bytes32 _name) public {

        owner = msg.sender;
        name = _name;

        
        
        
        
        
        creator = TokenCreator(msg.sender);

    }

    function transfer(address newOwner) public {
        if (msg.sender != owner) return;

        
        
        
        
        
        if (creator.isTokenTransferOK(owner, newOwner))
            owner = newOwner;
    }

    [...rest snipped...]
}
