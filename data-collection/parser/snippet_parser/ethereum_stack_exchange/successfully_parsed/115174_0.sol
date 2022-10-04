pragma solidity ^0.8.7;

contract Auction {
    struct Asset {
        string name;
        uint256 value;
        address owner;
    }

    Asset[] public assets;
    uint256 numAssets = 0;
    address manager;

    constructor() {
        manager = msg.sender;
        createAsset("AAA", 0.001 ether, manager);
        createAsset("BBB", 0.001 ether, manager);
        createAsset("CCC", 0.001 ether, manager);
        createAsset("DDD", 0.001 ether, manager);
        createAsset("EEE", 0.001 ether, manager);
    }

    function createAsset(string memory name, uint256 value, address owner) public payable {
        Asset storage newAsset = assets[numAssets];
        newAsset.name = name;
        newAsset.value = value;
        newAsset.owner = owner;
        numAssets++;
    }
}
