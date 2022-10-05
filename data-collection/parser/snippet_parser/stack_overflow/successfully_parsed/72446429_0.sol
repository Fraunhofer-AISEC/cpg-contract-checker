
pragma solidity ^0.8.0;

import "@klaytn/contracts/contracts/KIP/token/KIP37/KIP37.sol";

contract ItemMint is KIP37 {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    function mint(address to) public pure returns (bool) {
        require(msg.sender == to , "your are authorized");
        return true;
    }
}
