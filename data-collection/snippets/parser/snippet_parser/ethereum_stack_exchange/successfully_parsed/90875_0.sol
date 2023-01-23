
pragma solidity >=0.4.21 <0.7.0;

library SomeLib {
    function add(uint256 a, uint256 b) public returns(uint256);
}

contract SomeContract {
    
    function calc(uint256 a, uint256 b) public returns(uint256) {
        uint256 ans = SomeLib.add(a, b);
        return ans;
    }
}
