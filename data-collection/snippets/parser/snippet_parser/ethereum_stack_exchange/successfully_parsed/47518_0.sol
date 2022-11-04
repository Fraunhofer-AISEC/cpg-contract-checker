pragma solidity ^0.4.4;

contract WeirdCase {

    address internal owner;
    uint256[] newArray;

    constructor() {
        owner = msg.sender;
    }

    function someMethod1() external {
        uint256[] memory newArray = new uint256[](10);
        for (uint256 i = 0; i < 10; i++) {
            newArray[i] = i;
        }
    }

    function someMethod2() external {
        for (uint256 i = 0; i < 10; i++) {
            newArray.push(i);
        }
    }

    function someMethod3() external {
        uint256[] storage weirdArray;
        for (uint256 i = 0; i < 10; i++) {
            weirdArray.push(i);
        }
    }

    function getOwner() view returns(address) {
        return owner;
    }
}
