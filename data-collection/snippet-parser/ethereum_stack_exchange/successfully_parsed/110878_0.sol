
pragma solidity ^0.8.4;


library SafeMath {
    
    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;
        return c;
    }

    
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);
        return c;
    }
}
