pragma solidity ^0.4.0;

contract Hello {

    event TestEvent(uint256[] array);

    function hello() public {
        uint256[] memory output;
        for (uint i = 0; i < 5; i++) {
            output[i] = i;
        }
        TestEvent(output);
    }

}
