pragma solidity ^0.4.0;

contract RegisterContract{

event setNewUser(bytes32 name,address etherAddr, address contractAddr,uint now);
address owner;
struct User{
    bytes32 name;
    address etherAddr;
    address contractAddr;
}
User[] private users;

constructor() public{
    owner = msg.sender;
}
modifier checkOwner(){
    require(msg.sender == owner);
    _;
}
function getOwner() public view returns (address){
    return owner;
}

function registerUser(bytes32 name,address etherAddr, address contractAddr) public checkOwner{
    User memory newUser;
    newUser.name = name;
    newUser.etherAddr = etherAddr;
    newUser.contractAddr = contractAddr;
    users.push(newUser);
    emit setNewUser(name,etherAddr,contractAddr,now);
}

function setAddress(bytes32 name,address etherAddr, address contractAddr) public checkOwner{
    for(uint8 i=0;i<users.length;i++){
        if(users[i].name==name){
            users[i].etherAddr=etherAddr;
            users[i].contractAddr=contractAddr;
        }
    }
}

function getUsers() public checkOwner view returns (bytes32[],address[],address[]) {
    bytes32[] memory names= new bytes32[](users.length);
    address[] memory etherAddr = new address[](users.length);
    address[] memory contractAddr = new address[](users.length);
    for(uint8 i=0;i<users.length;i++){
        names[i]= users[i].name;
        etherAddr[i] = users[i].etherAddr;
        contractAddr[i] = users[i].contractAddr;
    }
    return (names,etherAddr,contractAddr);
}

function getContractAddress(address etherAddr) public checkOwner view returns (bytes32,address) {
    for(uint8 i=0;i<users.length;i++){
        if(users[i].etherAddr==etherAddr){
            return (users[i].name,users[i].contractAddr);
        }
    }
}
}
