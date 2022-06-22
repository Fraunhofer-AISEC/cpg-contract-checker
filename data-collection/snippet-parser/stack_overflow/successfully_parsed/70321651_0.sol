pragma solidity ^0.8;

contract MyContract {
    function foo() external {
        address recipient = address(0x123);
        payable(recipient).transfer(1 ether);
    }
}
