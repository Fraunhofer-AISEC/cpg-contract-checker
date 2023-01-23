pragma solidity ^0.6.1;

contract testFallback  {
    address payable public addr = 0x...;
    receive() external payable {
        if (msg.value > 0) {
            if (!addr.send(address(this).balance)) revert();
        }
    }
}
