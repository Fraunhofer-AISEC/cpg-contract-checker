pragma "^0.7.0"

contract myContract {
  address public payable owner;
  uint public value;  

  constructor(uint _value) payable {
    owner = msg.sender;
    value = _value;  
  }
}
