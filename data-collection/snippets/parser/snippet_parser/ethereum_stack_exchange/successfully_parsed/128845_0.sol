

pragma solidity >=0.7.0 <0.9.0;

interface ICallee {
   function foo() external;
}

contract Caller {
    function callFoo(ICallee callee) external returns(bool){
        try callee.foo() {
            return false;
        } catch {
            return true;
        }
    }
}


contract CalleeReverting is ICallee {
    function foo() external override {
        revert("CATCH THIS"); 
    }
}

contract CalleeIncompatible {
}
