pragma solidity ^0.4.17;


contract Test_Oracle {

  
  
  mapping(uint => uint) oracle_values;

  
  
  function StoreDocument(uint _key, uint _value) public {
    oracle_values[_key] = _value;
  }

  
  function RetrieveData(uint _date) public constant returns (uint data) {
    return oracle_values[_date];
  }
}
