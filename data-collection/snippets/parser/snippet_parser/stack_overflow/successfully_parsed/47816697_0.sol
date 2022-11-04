    pragma solidity ^0.4.4;

  
  
contract LuxSecure {
address public contract_owner;           

bytes32 public model;            
mapping(uint => address) public owners; 
uint256 public owners_count;
bytes32 public status;           
bytes32 public date_manufactured;   


function manufacturer() public{
  if(owners_count == 0){
  contract_owner = msg.sender;
}
}


modifier onlyOwner(){
  require(msg.sender == contract_owner);
  _;
}
 
function addNewGoods(bytes32 _model,bytes32 _status, bytes32 _date_manufactured) public returns(bool made) {
setOwner(msg.sender);
model = _model;
status = _status;
date_manufactured =  _date_manufactured;
return true;
}


function transferOwnership(address _newOwner) public onlyOwner(){
  require(_newOwner != address(0));
  contract_owner = _newOwner;
}


function setOwner(address owner)public{
   owners_count += 1 ;
   owners[owners_count] = owner;
}


function previousOwner()constant public returns(address){
  if(owners_count != 0){
  uint256 previous_owner = owners_count - 1;
  return owners[previous_owner];
}
}


function getManufacturer() constant public returns(address){
  return contract_owner;
}

function getCurrentOwner() constant public returns(address){
  return owners[owners_count] ;
}

function getOwnerCount() constant public returns(uint256){
  return owners_count;
}

function getModel() constant public returns(bytes32){
  return model;
}

function getStatus() constant public returns(bytes32){
return status;
}

function getDateManufactured() constant public returns(bytes32){
  return date_manufactured;
}

}
