
pragma solidity ^0.8.12;

contract ETH{
    address public  buyer;
    uint public amt;
    address public seller;
    constructor(){
        seller = msg.sender;
    }
    function add(address payable _buyer) payable public{
        buyer = _buyer;
        payable(buyer).transfer(amt);
    }
    function bal() view public returns(uint){
        return buyer.balance;
    }
    function s() payable public returns(uint){
        return msg.value;
    }
}
