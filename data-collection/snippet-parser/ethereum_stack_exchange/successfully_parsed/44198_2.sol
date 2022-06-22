pragma solidity 0.5.0;
pragma experimental ABIEncoderV2; 

contract ABI {

    struct TestStruct {
        uint size;
    } 

    function testFunc(TestStruct memory test) public pure returns(bool replaced) {
        return test.size == 0;
    }
}
