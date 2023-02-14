contract SixthContract is Ownable {

    string secret;
    SecretVault secretVault;

    constructor (string memory _secret) public {
        secretVault = new SecretVault(_secret);
        secret = _secret;
    }

    function getSecret() public view onlyOwner returns(string memory) {
        return secretVault.getSecret();
    }
    
}
