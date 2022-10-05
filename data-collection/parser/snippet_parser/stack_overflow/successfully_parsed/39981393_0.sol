contract IdisContractsFTW {
  uint storedData;
  string name;

  event SetName(address indexed _from, string _name);

  function set(uint x) {
    storedData = x;
  }

  function get() constant returns (uint retVal) {
    return storedData;
  }

  function setName(string _name){
    name = _name;
    SetName(msg.sender, _name);
  }

  function getName() constant returns (string retVal){
    return name;
  }

}
