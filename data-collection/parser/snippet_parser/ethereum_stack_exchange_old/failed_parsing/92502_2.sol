contract X {
  function transfer(address dest, uint amount) public { ... }
}
contract Y {
  function take() public payable {
    
    X ref = X(addressOfX);
    
    ref.transfer(destAddress, msg.value);
}
