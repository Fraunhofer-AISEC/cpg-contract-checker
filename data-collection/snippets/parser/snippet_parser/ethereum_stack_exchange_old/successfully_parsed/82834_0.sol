pragma solidity 0.6.5;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract A is AccessControl {

    event EventCreated(address creator, uint value);

    modifier onlyCreator(address account) {
        require(hasRole(CREATOR_ROLE, account), "Only creators allowed");
        _;
    }

    constructor() public {
        _setupRole(CREATOR_ROLE, msg.sender);
    }

    function createEvent(uint amount) public onlyCreator(msg.sender) {
        emit EventCreated(msg.sender, amount);
    }
}
