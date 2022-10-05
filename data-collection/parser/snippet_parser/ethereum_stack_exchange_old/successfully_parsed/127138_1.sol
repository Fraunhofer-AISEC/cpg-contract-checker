
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

contract Test {
    using Strings for *;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        string memory _ownerAddress = Strings.toHexString(uint160(uint160(owner)));
        string memory _calledAddress = Strings.toHexString(uint160(uint160(msg.sender)));
        require(msg.sender == owner, string(abi.encodePacked( "Owner mismatch: ", _ownerAddress, " != ", _calledAddress)));
        _;
    }

    function test() public onlyOwner {
        
    }
}
