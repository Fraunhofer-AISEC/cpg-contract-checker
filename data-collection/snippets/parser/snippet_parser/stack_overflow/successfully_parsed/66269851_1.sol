function balanceOf(address owner, string tokenName) public view override returns (uint256) {
    if(tokenName == “weapon”) {
       return ownerAndHisWeaponTokensDictionary[owner].length;
    }
    else if(tokenName == “vehicle”) {
       return ownerAndHisVehicleTokensDictionary[owner].length;
    }
}
