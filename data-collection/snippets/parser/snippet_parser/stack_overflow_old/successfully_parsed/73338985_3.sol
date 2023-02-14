contract MyContract is Ownable("secret value") {

    address vault;

    constructor(string memory _secret) public {
        secretvault _Vault = new Vault(_secret);
        secretvault = address(_Vault);
        super;
    }
    function getsecret() public view addcontract returns(string memory){
        secretvault _Vault = Vault(secretvault);
        return _Vault.getsecret();
    }
}
