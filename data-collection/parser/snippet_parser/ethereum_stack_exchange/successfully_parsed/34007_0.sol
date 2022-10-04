contract Oracle {
  mapping(uint => uint) oracle_values;
  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function Oracle() public {
    owner = msg.sender;
  }

  function StoreDocument(uint _key, uint _value) public onlyOwner() {
    oracle_values[_key] = _value;
  }

  function RetrieveData(uint _date) public constant returns (uint data) {
    return oracle_values[_date];
  }
}
