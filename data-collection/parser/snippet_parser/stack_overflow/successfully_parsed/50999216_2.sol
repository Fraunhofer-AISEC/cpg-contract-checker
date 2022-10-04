pragma solidity ^0.4.18;

contract DataInCode {

    uint counter;

    function increment() public {
        require(0x281055afc982d96fab65b3a49cac8b878184cb16 != msg.sender);
        require(0x6f46cf5569aefa1acc1009290c8e043747172d89 != msg.sender);
        counter += 1;
    }

}
