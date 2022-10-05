contract Victim {
  uint some;
  function foo(address _contract) {
    
    SomeInterface(_contract).changeStorage(10);
    
  }
}

contract Storage {
  uint value;
  function changeStorage(uint _value) {
    require(msg.sender == victim);
    value = _value;
  }
}

contract Attacker {

  function changeStorage(uint _value) {
     bytes memory data = 0x.. 
     execute(victim, data);
  }

  function execute(address _target, bytes memory _data) {
    (bool success,) = _target.delegatecall(_data);
  }
}
