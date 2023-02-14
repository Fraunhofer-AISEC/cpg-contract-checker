pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/math/SafeMath.sol";

contract Test {

    using SafeMath for uint256;

    function divide(uint256 a, uint256 b) public pure returns(uint256) {
        return a / b;   
    }

    function safeDivide(uint256 a, uint256 b) public pure returns(uint256) {
        return a.div(b);   
    }
}
