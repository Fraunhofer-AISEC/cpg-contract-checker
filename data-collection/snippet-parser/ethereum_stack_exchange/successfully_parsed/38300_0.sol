function freezeAccount(address target, bool freeze) public onlyOwner {
    frozenAccount[target] = freeze;
    FrozenFunds(target, freeze);
}  

function frozen(address _target) public returns (bool frozen) {
    return frozenAccount[_target];
}
