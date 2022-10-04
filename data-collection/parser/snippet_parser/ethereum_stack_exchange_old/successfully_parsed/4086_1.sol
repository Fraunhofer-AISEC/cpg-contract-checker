pragma solidity ^0.4.4;

contract SimpleEnum {

  enum VirtualTrade {DEFAULT,ONE,TWO}
  VirtualTrade vt;

    function SimpleEnum(){
        vt = VirtualTrade.DEFAULT;
    }

  function setValues(uint _value) {
      require(uint(VirtualTrade.TWO) >= _value);
      vt = VirtualTrade(_value);
  }

  function getValue() constant returns (uint){
      return uint(vt);
  }

}
