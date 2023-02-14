pragma solidity ^0.4.19;

contract Hello {

    event TestEvent(uint256[] array);

    function hello() public {
        uint256[] memory output = new uint256[](5);
        for (uint256 i = 0; i < 5; i++) {
            output[i] = i;
        }
        TestEvent(output);
    }
}
