pragma solidity 0.5.16;

contract Ownable {

    address public owner;

    modifier onlyOwner  {
        require(msg.sender == owner);
        _;
    }

    constructor () internal {
        owner = msg.sender;
    }
}
