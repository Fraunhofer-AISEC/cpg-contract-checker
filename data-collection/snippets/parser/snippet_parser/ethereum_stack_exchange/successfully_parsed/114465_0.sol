

pragma solidity >=0.7.0 <0.9.0;



contract Ownable {

    address owner;

    constructor()  public {
        owner = msg.sender;
    }


    modifier onlyOwner() {
        require(msg.sender == owner, "Must be Owner.");
        _;
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) public {
        secret = _secret;
    }

    function getSecret() public view returns(string memory) {
        return secret;
    }
}

contract SixthContract is Ownable {

    string secret;

    constructor (string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret);
        secret = _secret;
        super;
    }

    function getSecret() public view onlyOwner returns(string memory) {
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
    }
    
}
