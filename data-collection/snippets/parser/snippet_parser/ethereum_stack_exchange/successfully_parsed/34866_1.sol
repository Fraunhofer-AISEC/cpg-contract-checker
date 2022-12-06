pragma solidity ^0.4.18;

contract ArrayOfStructsContainsArrayOfStructs {

  struct InnerStruct {
    uint x;
  }

  struct OuterStruct {
    InnerStruct[] innerStructs;
  }

  
  OuterStruct[] outerStructs;

  event LogAppendedOuterStruct(address sender, uint outerStructRow);
  event LogAppendedInnerStruct(address sender, uint outerStructRow, uint innerStructRow);
  event LogSetInnerStructValue(address sender, uint outerStructRow, uint innerStructRow, uint value);

  function appendOuterStruct() public returns(uint row) {
    LogAppendedOuterStruct(msg.sender, outerStructs.length);
    outerStructs.length++;
    return outerStructs.length-1;
  }

  
  function appendInnerStruct(uint outerStructRow) public returns(uint row) {
    LogAppendedInnerStruct(msg.sender, outerStructRow, outerStructs[outerStructRow].innerStructs.length);
    outerStructs[outerStructRow].innerStructs.length++;
    return outerStructs[outerStructRow].innerStructs.length-1;
  }

  function setInnerStructValue(uint outerStructRow, uint innerStructRow, uint value) public returns(bool success) {
    outerStructs[outerStructRow].innerStructs[innerStructRow].x = value;
    LogSetInnerStructValue(msg.sender, outerStructRow, innerStructRow, value);
    return true;
  }

  function getInnerStructValue(uint outerStructRow, uint innerStructRow) public view returns(uint value) {
    return outerStructs[outerStructRow].innerStructs[innerStructRow].x;
  }

}
