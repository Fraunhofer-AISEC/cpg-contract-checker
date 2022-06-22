

pragma solidity >=0.7.0 <0.9.0;

contract B {
    uint public totalSupply;
    
    function incrementTotalSupply() public {
        totalSupply++;
    }
    
    function getTotalSupply() public view returns (uint) {
        return totalSupply;
    }
}
