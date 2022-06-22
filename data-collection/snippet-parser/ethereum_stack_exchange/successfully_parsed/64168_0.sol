pragma solidity >=0.4.22 <0.6.0; 

contract Asset {

uint256 public owners_count;
address public contract_owner;              
bytes32 public land_id;                   
bytes32 public land_sqrfeet;              
bytes32 public land_created_date;         
mapping(uint => address) public owners;     

function createland(bytes32 _land_id, bytes32 _land_sqrfeet, bytes32 _land_created_date) public returns (bool){
    setOwner(msg.sender);
    land_id = _land_id;
    land_sqrfeet = _land_sqrfeet;
    land_created_date = _land_created_date;
    return true;
}


modifier onlyOwner(){
    require(msg.sender == contract_owner);
    _;
}


function transferOwnership(address _newOwner) public onlyOwner(){
    require(_newOwner != address(0));
    contract_owner = _newOwner;
}


function previousOwner() view public returns(address){
    if(owners_count != 0){
        uint256 previous_owner = owners_count - 1;
        return owners[previous_owner];
    }
}

function setOwner(address owner)public{
    owners_count += 1 ;
    owners[owners_count] = owner;
}

function getCurrentOwner() view public returns(address){
    return owners[owners_count] ;
}

function getOwnerCount() view public returns(uint256){
    return owners_count;
}}
