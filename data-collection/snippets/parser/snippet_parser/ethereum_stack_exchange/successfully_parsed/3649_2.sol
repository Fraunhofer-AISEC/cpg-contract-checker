
pragma solidity ^0.8.7;

contract sendether{
    address payable public owner;
    bytes public data;
    constructor()payable {
     owner=payable(msg.sender);   
    }
   
    uint public contractbalance;
    uint public ownerbalance;
    uint public balanceto;
    
    function sendviacall(address payable _to,uint _value)public payable{
        (bool sent,)=_to.call{value: _value}("");
        ownerbalance=owner.balance;
        balanceto=_to.balance;
        contractbalance=address(this).balance;
        require(sent,"failed to send");
    }
}`
