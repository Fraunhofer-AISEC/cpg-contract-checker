
pragma solidity ^0.8.0;

library MyLib {
    enum MyEnum {
        A, B
    }

    function f() public pure returns (uint){
        
        
        return uint(MyEnum.A);
    }
}
