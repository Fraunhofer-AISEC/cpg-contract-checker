    function mint(address beneficiary, uint amount) onlyRole(ROLE_MINTER) whenNotPaused public returns(bool){
    require(hasRole(msg.sender, ROLE_MINTER), "Caller is not a minter");
    _mint(msg.sender, beneficiary, amount, "", "");
    return true;
}
