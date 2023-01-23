pragma solidity 0.8.6;

contract Simple {
    uint value;
    constructor() payable {
        value = 22;
    }

    function foo() public {
        require(address(this).balance >= 0.1 ether);
        payable(msg.sender).call{value: 0.1 ether}(abi.encode(value));
    }
}
