

pragma solidity 0.8.16;

contract Bulksend {
    address payable recipient;

    constructor() {
        recipient = payable(msg.sender);
    }
   function send(uint256 amount)payable public{
       amount = msg. value;
     payable(recipient).transfer(amount);
   }
}
