pragma solidity ^0.8.0;

contract NFT {
    uint256 id;
    string name;
    string description;
    address owner;

    constructor(uint256 _id, string memory _name, string memory _description) public {
        id = _id;
        name = _name;
        description = _description;
        owner = msg.sender;
    }

    function transfer(address newOwner) public {
        require(msg.sender == owner, "Only the owner can transfer the NFT");
        owner = newOwner;
    }

    function getInfo() public view returns (uint256, string memory, string memory, address) {
        return (id, name, description, owner);
    }

    function getAddress() external view returns(address) {
        return address(this);
    }
}
