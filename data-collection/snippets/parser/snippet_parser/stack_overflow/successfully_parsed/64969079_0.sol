pragma solidity ^0.7.0;

contract SubscriptionPayment {


address public owner = msg.sender
;


modifier onlyOwner{
    require(msg.sender == owner);
_;
}

receive() external payable{
}


function withdraw(uint _value) external onlyOwner {
    msg.sender.transfer(_value)
;
}


address payable public account1Address = 0xF6D461F87BBce30C9D03Ff7a8602156f006E2367 ;
address payable public account2Address = 0xb6a76127EDf7E0B7dfcEd9aDE73Fa8780eC26592 ;
address payable public account3Address = 0x722b95CA56b1C884f574BAE4832f053197Ca3F58 ;


function paySubscriptions() external onlyOwner {
    account1Address.transfer(1000000000000000000);
    account2Address.transfer(1000000000000000000);
    account3Address.transfer(2000000000000000000);
}
}