pragma solidity^0.4.18;

contract project3{

address owner;

struct Users{
string companyName;
string role; 
string country; 
string city;
uint phoneNo;
string physicalAddress;}

constructor (uint _tokens)public{
owner=msg.sender;
}

modifier only_admin{
require(msg.sender==owner);
_;}

mapping(address=>Users)users;

address[] private stakeholders;

function addUsers(address _address, string _companyName,string _role, string 
_country,
string _city, uint _phoneNo, string _physicalAddress)only_admin public{
var user= users[_address];
user.companyName=_companyName;
user.role=_role;
user.country=_country;
user.city=_city;
user.phoneNo=_phoneNo;
user.physicalAddress=_physicalAddress;
stakeholders.push(_address);}

function getUser(address _address)public constant 
returns(string,string,string,string,uint,string){
return(users[_address].companyName,
users[_address].role,users[_address].country,
users[_address].city,users[_address].phoneNo,
users[_address].physicalAddress);}
}
