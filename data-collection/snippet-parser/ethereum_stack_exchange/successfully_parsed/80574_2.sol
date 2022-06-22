function snd(uint256 amount) public payable {
    rc.dep.value(amount)();
}
