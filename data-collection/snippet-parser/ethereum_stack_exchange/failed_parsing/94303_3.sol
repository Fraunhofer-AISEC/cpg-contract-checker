contract Storage {

  function getUint(bytes32 key) public view returns(unit) {
    return datastoreUint[key];
  }

contract Logic }

  Storage storage; 

  function getSomething(address user) public view returns(unit) {
    bytes32 key = hashFunction(arguments); 
    return storage.getUint(key);
  }
