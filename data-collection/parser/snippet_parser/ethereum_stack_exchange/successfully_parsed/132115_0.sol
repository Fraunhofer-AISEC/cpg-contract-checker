
pragma solidity ^0.6.0;

import "forge-std/Test.sol";

contract King is Test {
    constructor() public payable {}

    receive() external payable {
        log_named_address("receive() from", msg.sender);
        log_named_uint("value is", msg.value);
    }
}
