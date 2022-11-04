pragma solidity ^0.5.11;

contract SillyOwner {
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    event OwnerChange(
        address oldOwner,
        address newOwner
    );

    function changeOwner(address _no) public { 
        require(msg.sender == owner, "Insufficient permission");
        address ow = owner;
        owner = _no;
        emit OwnerChange(ow, owner);
    }
}
