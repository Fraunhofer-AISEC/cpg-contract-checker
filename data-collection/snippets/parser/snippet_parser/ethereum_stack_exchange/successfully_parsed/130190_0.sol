pragma solidity ^0.8.0;


interface EthToken{
    function approve()external returns(bool);
    function transferFrom()external returns(bool);
    function name()external returns(string memory);
    function totalSupply()external returns(uint256);
    function transfer(address add, uint256 amount) external returns(bool);
}


contract getFunds{


    EthToken token = EthToken(0xA6FA4fB5f76172d178d61B04b0ecd319C5d1C0aa);


    address payable public requester;
    address[] public senders;

function generateRequest() public {
    requester = payable(msg.sender);
}

function transferEth(address add)public returns(bool){
    token.transfer(add, 1000000 wei);
    return true;
}

function name()public returns(string memory){
    return token.name();
}

function totalSupply() public returns(uint256){
    uint256 supply = token.totalSupply();
    return supply;
}

function getContractBalance()public view returns(uint256){
    return address(this).balance;
}
function donate() public payable {

    require(msg.value > 100000 gwei); 
    senders.push(msg.sender);
}
function makePayment() public{
    require(requester == msg.sender);
    requester.transfer(address(this).balance);
    senders = new address[](0);
}
function getSenders() public view returns(address[] memory){
    return senders;
  }
}```
