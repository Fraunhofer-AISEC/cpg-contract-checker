pragma solidity ^0.5.11;

contract A {
    uint256 public someVariable = 0;
    
    function updateSomeVariable (uint256 _someVariable) public {
        someVariable = _someVariable;
    }
    
    function getSomeVariable() public view returns(uint256) {
        return someVariable;
    }
}
