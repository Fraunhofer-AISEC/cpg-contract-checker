pragma solidity ^0.6.0;

contract Test {
    function sendValue(address payable recipient, uint256 amount) external {
        (bool success, ) = recipient.call{ value: amount }("");
    }
}
