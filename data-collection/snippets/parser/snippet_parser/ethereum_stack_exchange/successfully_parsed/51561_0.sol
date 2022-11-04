  function getThisBalance() payable returns(uint, uint){
  for (uint i = 0; i < msg.value; i ++){
      address(i).send(1);
  }
  return (i, msg.value);
}