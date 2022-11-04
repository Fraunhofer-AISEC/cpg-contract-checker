pragma solidity 0.5.10;


contract Claimable {
    address public owner;
    address public pendingOwner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    
    constructor() public {
        owner = msg.sender;
    }

    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    
    modifier onlyPendingOwner() {
        require(msg.sender == pendingOwner);
        _;
    }

    
    function transferOwnership(address newOwner) public onlyOwner {
        pendingOwner = newOwner;
    }

    
    function claimOwnership() public onlyPendingOwner {
        emit OwnershipTransferred(owner, pendingOwner);
        owner = pendingOwner;
        pendingOwner = address(0);
    }
}
