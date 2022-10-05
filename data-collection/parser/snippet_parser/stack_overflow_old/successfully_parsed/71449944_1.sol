pragma solidity ^0.8.0;
contract Money {
uint public money = 0;

function getMoney() public view returns(uint256) {
    return money;
}

function updateMoney() external {
    money += 1;
}
}
