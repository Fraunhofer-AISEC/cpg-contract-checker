pragma solidity ^0.5.7;

contract Foo {
    event TipSent (address indexed who, uint256 amount);
    event OwnershipTransferred (address indexed oldOwner, address newOwner);

    function tipPoolOwner() public payable{
        require(msg.value > 0);
        require(msg.sender != owner());
        address payable poolOwner = address(uint160(owner()));
        poolOwner.transfer(msg.value);
        emit TipSent(msg.sender, msg.value);
    }

    address private _owner;

    constructor () public {
        _owner = msg.sender;
    }

    function owner() public view returns (address) {
        return _owner;
    }
}
