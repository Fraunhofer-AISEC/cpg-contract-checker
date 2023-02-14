

pragma solidity >=0.7.0 <0.9.0;

contract Test {

    function testing() public pure returns (string memory) {
        string memory x = "Hello";
        callOtherFunction(x);
        
        return x;
    }
    
    function callOtherFunction(string memory _x) internal pure {
        _x = "Goodbye";
    }
    
}
