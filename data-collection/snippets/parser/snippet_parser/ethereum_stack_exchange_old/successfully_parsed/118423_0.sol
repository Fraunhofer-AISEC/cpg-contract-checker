
pragma solidity ^0.8.2;

contract MainContract {
    address owner;
    string name;

    struct FundAsset {
        address assetAddress;
        uint assetWeight;
        string assetName;
        string assetAbbreviation;
    }

    event createFundEvent(uint date);

    constructor(string memory _name) {
        owner = msg.sender;
        name = _name;
    }

    function createFund() external {

        emit createFundEvent(block.timestamp);
        
    }
}
