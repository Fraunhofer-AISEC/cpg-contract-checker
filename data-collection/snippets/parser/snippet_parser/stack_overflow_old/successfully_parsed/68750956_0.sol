pragma solidity 0.8.7;

contract Example {
    
    function f1() public returns(uint) {
        uint output1 = 1;
        f2();
        return output1;
    }
    
    function f2() private returns(uint) {
        uint output2 = 2;
        return output2;
    }
}
