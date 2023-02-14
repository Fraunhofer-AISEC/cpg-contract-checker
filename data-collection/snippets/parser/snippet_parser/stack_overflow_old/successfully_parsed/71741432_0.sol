
pragma solidity ^0.8.4;

contract Contract {
    address payable public a;
    address  payable public owner  ;
    constructor(address _charity) {
        owner   = payable (msg.sender);
        a = payable(_charity);
    }
    event Received(address, uint);
     receive() external payable {
    emit Received(msg.sender, msg.value);
    }
    function tip() public payable {
      payable(owner).transfer(msg.value);
  }
  function donate() public payable {
     a.transfer(msg.value);
   }
}
