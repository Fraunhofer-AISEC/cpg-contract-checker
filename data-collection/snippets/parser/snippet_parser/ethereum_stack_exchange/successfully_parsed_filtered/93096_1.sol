pragma solidity >=0.8.0;
contract SimpleTransaction {
address payable receiver = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

function sendTo(uint256 amount)   external  payable  {
    require(msg.sender.balance >= amount, "Error because balance");
    receiver.transfer(amount); 
}
}