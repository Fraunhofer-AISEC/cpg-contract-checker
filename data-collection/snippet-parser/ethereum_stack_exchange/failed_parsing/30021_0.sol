contract myContract{
  .......
  function getbalance() public constant returns(address){
      require(msg.sender==owner);
       .....
  }
 }
