
pragma solidity >=0.4.22 <0.9.0;


contract TokenCreator {
    
    address public owner;
    address public this_address;
    
    constructor(){
        owner = msg.sender;
        this_address = address(this);
    }
    
    function createToken(string memory name) public returns ( bool success, OwnedToken tokenAddress){
        return ( true, new OwnedToken(name));
    }

    function changeName(OwnedToken tokenAddress, string memory name) public {
        tokenAddress.changeName(name);
    }


    function isTokenTransferOK(address currentOwner, address newOwner) public pure returns (bool ok) { 
        return keccak256(abi.encodePacked(currentOwner, newOwner))[0] == 0x7f;
    }
    
}

contract OwnedToken {
    address public owner;
    string public name;
    TokenCreator public creator;

    constructor(string memory _name) {    
        owner = msg.sender;
        creator = TokenCreator(msg.sender);
        name = _name;
    }

    function changeName(string memory newName) public {
        if (msg.sender == address(creator))
            name = newName;
    }

    function transfer(address newOwner) public {
        if (msg.sender != owner) return;
        if (creator.isTokenTransferOK(owner, newOwner))
            owner = newOwner;
    }
}
