pragma solidity ^0.4.4;
contract IamHongKongTokenBack_00{ 



mapping(address => uint256)  lastBalance;

function saveBalance() public  {
    lastBalance[msg.sender] = msg.sender.balance;
}   


function fetchBalance(address _address) constant public returns (uint256) {
    return lastBalance[_address];
}   


}
