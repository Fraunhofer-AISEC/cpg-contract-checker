Contract Hello {
  address[] internal Pool;

  function () public payable {
  require(msg.value * 10 == 1 ether);

  if (msg.sender already exist in address[]){
    revert();
    Rejected();

  } else {
    Pool.push(msg.sender);
  }
 }
}
