Contract Hello {
  address[] internal Pool;
  mapping (address => boolean) private oldUsers;


  function () public payable {
  require(msg.value * 10 == 1 ether);

  
  if (oldUsers[msg.sender]){
    revert();
    Rejected();

  } else {
    Pool.push(msg.sender);
    
    oldUsers[msg.sender] = true;
  }
 }
}
