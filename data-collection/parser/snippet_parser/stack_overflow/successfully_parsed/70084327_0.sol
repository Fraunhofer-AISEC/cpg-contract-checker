
pragma solidity ^0.8.0;

contract Contract {

    address public owner;
    address public admin;

    constructor(address _admin) public {
        owner = msg.sender;
        admin = _admin;
    }

    modifier onlyOwner(address sender) {
        require(
            sender == admin,
            "Only the admin of the contract can perform this operation."
        );_;
    }

    function sendTo (
        address toAddress
    ) public payable onlyOwner(msg.sender) {
        payable(toAddress).transfer(msg.value);
    }
}
