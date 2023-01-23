pragma solidity ^0.4.15;

contract CONTRACT1{

event senderLogger(address);
event valueLogger(uint);

address person1Adress;
address person2Adress;

function () payable { 
senderLogger(msg.sender);
valueLogger(msg.value);

person1Adress = 0x705b4e2d44be431740b11fa9ba6ace47bef8d035;
person1Adress.transfer(msg.value / 10); 

person2Adress = 0xC0BB3c8362628E152f70b602de4B7CFB41516618;
person2Adress.transfer((msg.value / 10) * 9);
} 
}
