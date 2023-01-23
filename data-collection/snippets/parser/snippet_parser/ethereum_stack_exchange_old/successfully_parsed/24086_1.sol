pragma solidity ^0.5.0;

contract SimpleEnum {

  enum SomeData {DEFAULT,ONE,TWO}
  SomeData someData;

  constructor() public {
      someData = SomeData.DEFAULT;
  }

  function setValues(uint _value) public {
      require(uint(SomeData.TWO) >= _value);
      someData = SomeData(_value);
  }

  function getValue() public view returns (uint){
      return uint(someData);
  }
}
