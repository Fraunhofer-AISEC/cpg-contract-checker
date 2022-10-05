
pragma solidity ^0.8.11;

contract Helper {

    function getRandomId() public view returns (uint) {
        return uint(blockhash(block.number - 1));
    }

}
