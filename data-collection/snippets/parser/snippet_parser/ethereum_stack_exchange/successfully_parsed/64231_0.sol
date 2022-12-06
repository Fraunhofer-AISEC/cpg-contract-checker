pragma solidity >=0.4.22 <0.6.0;

contract Asset {
struct asset {
    bytes32 asset_id;
    bytes32 asset_name;
    bytes32 asset_sqfeet;
    address owner;
}

asset[] items;

function createasset(bytes32 asset_id, bytes32 asset_name, bytes32 asset_sqfeet) public {
    address userwallet = msg.sender;
    asset memory m;
    m.asset_id = asset_id;
    m.asset_name = asset_name;
    m.asset_sqfeet = asset_sqfeet;
    m.owner = userwallet;
    items.push(m);
}

function getassetCount(address owner) public view returns (uint){
    uint count = 0;
    for(uint i=0; i < items.length; i++){
        if(items[i].owner == owner){
            count = count +1;
        }
    }
    return count;
}   

function getassetOwnership(address owner, bytes32 asset_id) public view returns (bool){
    for(uint i=0; i < items.length; i++){
        if(items[i].asset_id == asset_id){
            if(items[i].owner == owner){
                return true;    
            }
        }
    }
    return false;
}

function tranferasset(address new_owner, bytes32 asset_id) public payable {
    require(new_owner != msg.sender);
    address old_owner = msg.sender;
    for(uint i=0; i < items.length; i++){
        if(items[i].asset_id == asset_id){
            if(items[i].owner == old_owner){
                 items[i].owner = new_owner;
            }
        }
    }
}
}