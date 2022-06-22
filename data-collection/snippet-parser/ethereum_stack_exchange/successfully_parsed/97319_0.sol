contract OwnedToken {
    
    
    
    TokenCreator public creator;
    address public owner;
    string public name;

    
    
    function OwnedToken(string _name) {
        owner = msg.sender;
        
        
        
        
        creator = TokenCreator(msg.sender);
        name = _name;
    }

    function changeName(string newName) {
        
        
        
        if (msg.sender == address(creator))
            name = newName;
    }

    function transfer(address newOwner) {
        
        if (msg.sender != owner) 
            return;
        
        
        
        
        
        if (creator.isTokenTransferOK(owner, newOwner))
            owner = newOwner;
    }
}

contract TokenCreator {

    mapping(string => address) addresses;

    function getAddress(string name) constant returns (address) {
        return addresses[name];
    }

    function createToken(string name)
       returns (OwnedToken tokenAddress)
    {
        
        
        
        
        tokenAddress = new OwnedToken(name);
        addresses[name] = tokenAddress;
    }

    function changeName(string oldName, string newName) {
        
        
        address tokenAddress = addresses[oldName];
        delete addresses[oldName];
        addresses[newName] = tokenAddress;
        OwnedToken(tokenAddress).changeName(newName);
    }

    function isTokenTransferOK(
        address currentOwner,
        address newOwner
    ) returns (bool ok) {
        
        address tokenAddress = msg.sender;
        return (sha3(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
    }
}
