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
    data = 10;
    Test.TStruct memory s;
    s.x = sin.x;
    s.y = sin.y;
    return s.x;
  }
}

contract B {
  address public BAddr;

  function TalkToA () public {
    BAddr = new A();
    Test.TStruct memory sin = Test.TStruct(10, 5);
    BAddr.call(bytes4(keccak256("SetStruct((int256,int256))")), sin);
  }
}
