pragma solidity^0.5.0;

contract project3{

address owner;

string location; uint quantity; string product; uint payment; 

struct Users{
string companyName; string role; string country; string city; uint phoneNo;
string physicalAddress; 
bool certified;}

struct Product{
address producer;    
string name; uint quantity; string tag;
string proddescription;}

struct AssetTransfer{
string shipmentlocation; string asset; address sender; 
address receiver;
string trackingNo;
uint quantity;}

constructor (uint _tokens)public{
owner=msg.sender;
accbalance[owner]=_tokens;    
}

event Message(string message);
event Shipped(string _message, string trackingno, address _sender,string 
location);

modifier only_admin{
require(msg.sender==owner);
_;}

mapping (string=>Product)products;

mapping(address=>Users)users;

mapping (address=>uint) accbalance;

mapping(string=>AssetTransfer)assetTransfer;

address[] private stakeholders;

string[]private goods;

function addUsers(address _address, string _companyName,string _role, string 
_country,
string _city, uint _phoneNo, string _physicalAddress)only_admin public 
returns(bool) {

var user=users[_address];

if(bytes(user.companyName).length==0 && bytes(_companyName).length!=0){
user.companyName=_companyName;
user.role=_role;
user.country=_country;
user.city=_city;
user.phoneNo=_phoneNo;
user.physicalAddress=_physicalAddress;
stakeholders.push(_address);
emit Message('user added succesfully');
return true;}
else{
emit Message('user not added, enter different details');
return false;}
}

function getUser(address _address)public view 
returns(string,string,string,string,uint,string){
return(users[_address].companyName,
users[_address].role,users[_address].country,
users[_address].city,users[_address].phoneNo,
users[_address].physicalAddress);}

function addProduct(address _address,string _name,uint _quantity,string 
_tag,string _description)public returns(bool){
var prod= products[_tag];
if(bytes(prod.tag).length==0 && bytes(_tag).length!=0){
prod.producer=_address;    
prod.name=_name;
prod.quantity=_quantity;
prod.tag=_tag;
prod.proddescription=_description;
goods.push(_tag);
emit Message('Product added succesfully');
return true;}
else{
emit Message('Product cannot be added. duplicate serial number used');
return false;    
}}

function getProduct(string _tag)public view returns 
(address,string,uint,string,string){
return(products[_tag].producer,products[_tag].name,
products[_tag].quantity,products[_tag].tag,products[_tag].proddescription);}    

function makepayment(address _from, address _to, uint _amount)public 
returns(bool){
if(_amount<=0 && accbalance[_from]<_amount){
emit Message('cannot make payment,insufficient funds');    
return false;}
accbalance[_from]-=_amount; accbalance[_to]+=_amount;
emit Message('payment made succesuccesfully');
return true;}

function sendShipment(string _asset,string trackingNo, string _destination,
uint _quantity,address _reciever, address _sender)public returns(bool){
assetTransfer[trackingNo].asset=_asset;
assetTransfer[trackingNo].shipmentlocation=_destination;
assetTransfer[trackingNo].trackingNo=trackingNo;
assetTransfer[trackingNo].quantity=_quantity;
assetTransfer[trackingNo].sender=_sender;
assetTransfer[trackingNo].receiver=_reciever;
emit Shipped("shipment sent", trackingNo, _sender, _destination);
return true;}

function checkBalance(address _accountHolder)public view returns(uint){
return accbalance[_accountHolder];}

function setconditions(string _location,uint _quantity,uint _payment,string 
_asset,address _seller)public{
location=_location; quantity=_quantity; payment=_payment; product=_asset;
_seller=msg.sender; 
emit Message('conditions are set'); }

function getshipment(string _location,uint _quantity,string _asset,string 
trackingNo)public returns(bool){
if((assetTransfer[trackingNo].quantity)==_quantity && 
keccak256(abi.encodePacked(assetTransfer[trackingNo].asset))== 
keccak256(abi.encodePacked(_asset))){
emit Shipped('Shipment recieved',trackingNo,msg.sender,_location);    
if (keccak256(abi.encodePacked(location))== 
keccak256(abi.encodePacked(_location))){
makepayment(assetTransfer[trackingNo].receiver,
assetTransfer[trackingNo].sender,payment);}
else{
emit Message('Payment not made');}    
return true;}
else{
emit Message('wrong location/quantity/item');    
return false;}
}
function showProvenance(string _trackingNo)public view 
returns(string,string, address,address,string){
return(assetTransfer[_trackingNo].asset,
assetTransfer[_trackingNo].trackingNo, 
assetTransfer[_trackingNo].sender,
assetTransfer[_trackingNo].receiver,
assetTransfer[_trackingNo].shipmentlocation);}
}
