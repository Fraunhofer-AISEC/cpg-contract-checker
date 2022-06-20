pragma solidity 0.5.0;

contract ABI {

    struct TestStruct {
        uint size;
    } 

    function testFunc(uint test) public pure returns(bool replaced) {
        return test == 0;
    }
}
