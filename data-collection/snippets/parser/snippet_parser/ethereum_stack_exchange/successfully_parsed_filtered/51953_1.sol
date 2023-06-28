pragma solidity ^0.4.23;

contract IpfsLink{
    address owner;
    uint public lastHashId;
    uint hashCost = 0.001 ether;

    struct IpfsHash{
        address sender;
        string hashString;
        uint timestamp;
    }

    mapping (uint => IpfsHash) hashes;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() public{
        owner = msg.sender;
        lastHashId = 0;
    }

    function saveHash(string _hashContent) external payable {
        require(msg.value >= hashCost);

        uint hashId = ++lastHashId;
        hashes[hashId].sender = msg.sender;
        hashes[hashId].hashString = _hashContent;
        hashes[hashId].timestamp = now;
    }
}
