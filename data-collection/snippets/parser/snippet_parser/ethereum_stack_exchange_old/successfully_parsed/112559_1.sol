pragma solidity ^0.8.0;

contract MyContract {
    
    struct MyStruct {
      uint256 a;
      mapping(string => uint256) properties;
    }
    
    MyStruct testStruct;
    
    function testFunction() public {
        testStruct.properties['b'] = 100;
    }

}
