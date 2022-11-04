pragma solidity  ^0.5.11;
contract SillyContract {
    address private owner;
    constructor() public {
        owner = msg.sender;
    }
    modifier wasteEther(uint256 _lowestLimit) {
        uint256 counter = 0;
        while(gasleft() > _lowestLimit) counter++;
        _;
    }
    function getOwner() public view wasteEther(2900000) returns(address aa) {
        return owner;
    }
}
