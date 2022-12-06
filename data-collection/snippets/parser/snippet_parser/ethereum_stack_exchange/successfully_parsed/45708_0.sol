pragma solidity ^0.4.0;
contract VendingMachine {
function buy(uint amount) payable {
    if (amount > msg.value / 2 ether)
        revert("Not enough Ether provided.");
    
    require(
        amount <= msg.value / 2 ether,
        "Not enough Ether provided."
    );
    
 }
}
