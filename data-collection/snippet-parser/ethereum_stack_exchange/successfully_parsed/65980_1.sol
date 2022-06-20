pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

library Test { 
  struct TStruct {
    int x;
    int y;
  }   
}

contract A {

  function SetStruct (Test.TStruct sin) public returns (int) {
    Test.TStruct memory s;
    s.x = sin.x;
    s.y = sin.y;
    return s.x;
  }
}

contract Bnew {
  address public BAddr;
  bool public success;

  function TalkToA () public returns (bool) {
    BAddr = new A();
    Test.TStruct memory sin = Test.TStruct(10, 5);
    bytes memory data = abi.encodeWithSignature("SetStruct((int256,int256))", sin); 
    success = address(BAddr).call(data);
    return success;
  }
}
