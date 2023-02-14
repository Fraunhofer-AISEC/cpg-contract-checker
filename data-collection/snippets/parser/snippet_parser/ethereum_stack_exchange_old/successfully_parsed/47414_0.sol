pragma solidity '0.4.19';

contract Purchaseable {
  uint public price;
  address[] public buyers;

  function buy() public payable {
    require(msg.value >= price);

    
    buyers.push(msg.sender);

    
    uint change = msg.value - price;
    
    msg.sender.transfer(change); 
  }
}
