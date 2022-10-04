
pragma solidity ^0.8.6;

contract Counter {

    uint256[] ints = [1,2,3]; 

    bytes[] bs = [bytes("")]; 

    string[] strs = ["one", "two"]; 

    

    

    struct Set {
        uint256 x;
        uint256 y;
        uint256 expected;
    }

    modifier parameterizedTest(Set[] memory sets) {
        
        _;
    }

    function testSomething(Set[] memory _sets) external parameterizedTest(_sets) {
        
    }

}
