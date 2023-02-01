contract MappingTest {

  CustomMap balances;

  struct CustomMap {
     mapping (address => uint) maps;
     address[] keys;
  }

  function put() payable public {
     address sender = msg.sender;
     uint256 value = msg.value;
     bool contain = contains(sender);
     if (contain) {
       balances.maps[sender] = balances.maps[sender] + value;
     } else {
       balances.maps[sender] = value;
       balances.keys.push(sender);
     }
  }

  function iterator() constant returns (address[],uint[]){
      uint len = balances.keys.length;
      address[] memory keys = new address[](len);
      uint[] memory values = new uint[](len);
      for (uint i = 0 ; i <  len ; i++) {
         address key = balances.keys[i];
         keys[i] = key;
         values[i] = balances.maps[key];
      }
      return (keys,values);
  }

  function remove(address _addr) payable returns (bool) {
      int index = indexOf(_addr);
      if (index < 0) {
          return false;
      }
      delete balances.maps[_addr];
      delete balances.keys[uint(index)];
      return true;
  }

  function indexOf(address _addr) constant returns (int) {
    uint len = balances.keys.length;
    if (len == 0) {
        return -1;
    }
    for (uint i = 0 ; i < len ;i++) {
      if (balances.keys[i] == _addr) {
          return int(i);
      }
    }
    return -1;
  }

  function contains(address _addr) constant returns (bool) {
      if (balances.keys.length == 0) {
         return false;
      }
      uint len = balances.keys.length;
      for (uint i = 0 ; i < len ; i++) {
          if (balances.keys[i] == _addr) {
            return true;
          }
      }
      return false;
  } 

}
