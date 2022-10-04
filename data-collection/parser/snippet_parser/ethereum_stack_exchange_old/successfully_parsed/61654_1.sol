pragma solidity^0.4.18;

contract project3{

address owner;

struct Users{
bytes32 companyName;
bytes32 role; 
bytes32 country; 
bytes32 city;
uint phoneNo;
bytes32 physicalAddress;}

constructor (uint _tokens)public{
owner=msg.sender;
}

modifier only_admin{
require(msg.sender==owner);
_;}

mapping(address=>Users)users;

address[] private stakeholders;

function addUsers(address _address, bytes32 _companyName,bytes32 _role, bytes32 
_country,
bytes32 _city, uint _phoneNo, bytes32 _physicalAddress)only_admin external{
var user= users[_address];
user.companyName=_companyName;
user.role=_role;
user.country=_country;
user.city=_city;
user.phoneNo=_phoneNo;
user.physicalAddress=_physicalAddress;
stakeholders.push(_address);}

function getUser(address _address)external constant 
returns(bytes32,bytes32,bytes32,bytes32,uint,bytes32){
return(users[_address].companyName,
users[_address].role,users[_address].country,
users[_address].city,users[_address].phoneNo,
users[_address].physicalAddress);}
}
