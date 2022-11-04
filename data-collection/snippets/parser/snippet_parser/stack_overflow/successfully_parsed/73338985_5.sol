

pragma solidity ^0.6.0;

contract Ownable {

   address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can accesss");
        _;
    }
}

contract Vault {
    
    string private secret;

    constructor(string memory _secret) public {
        secret = _secret;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

contract MyContract is Ownable {

    Vault vault;

    constructor(string memory _secret) public {
        vault = new Vault(_secret);
    }
    function getSecret() public view onlyOwner returns(string memory){
        return vault.getSecret();
    }
}

