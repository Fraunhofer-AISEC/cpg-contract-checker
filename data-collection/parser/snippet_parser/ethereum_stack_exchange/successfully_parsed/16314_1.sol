pragma solidity ^0.4.6;

contract Purchase {
address seller;
uint value;
event output_value(uint indexed val,address add);
function Purchase() payable {
    seller = msg.sender;
    value = msg.value / 2;
    output_value(value,seller);
    
    }
}
