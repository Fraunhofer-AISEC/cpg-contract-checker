pragma solidity ^0.4.2;

contract AssetDistribution { 
address public issuer;
uint public assetCount;

event AllocationDetails(address from, address to, string description);

function AssetDistribution() {
    issuer = msg.sender;
    
}

struct Asset {
    uint assetId;
    address currentOwner;
    string description;
    uint cost;
}
mapping (address=> mapping(uint=>Asset)) private owners;




function setCreateAsset(address newOwner, string description, uint cost) 
    returns(string) {
    if (msg.sender == issuer) {
    assetCount++;
    Asset memory myAsset = Asset(assetCount,newOwner,description,cost);      
    owners[newOwner][assetCount] = myAsset;
    AllocationDetails(msg.sender,newOwner,description);
    return "created By: government";
    
    } else { 
        return "This is not the creator";
    }
}

function getassetCount() constant returns(uint) {
    return assetCount;
}

function getOwner(uint id) returns(address) {
   
}

}
