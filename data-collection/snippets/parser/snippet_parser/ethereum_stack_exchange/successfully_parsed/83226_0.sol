pragma solidity ^0.5.16;

contract FlowTest {

    uint256 public a = 0;
    uint256 public b = 2**256-1; 

    function flow () external {
        a -= 1;
        b += 1;
    }
}
