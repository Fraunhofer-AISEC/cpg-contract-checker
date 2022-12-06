pragma solidity ^0.4.0;

contract SimpleWallet {
    address owner;
    mapping(address => bool) isAllowedToSendsFundsMapping;

    event deposit(address _sender, uint amount);
    event  withdraw(address _sender, uint amount, address _benificiary);

    function SimpleWallet()public{
        owner= msg.sender;
    }

    function (){
        if(msg.sender == owner || isAllowedToSendsFundsMapping[msg.sender]== true){
            deposit(msg.sender, msg.value);
        }else{
            throw;
        }
    }

    function sendFunds(uint amount, address receiver) returns (uint){
        if(msg.sender == owner || isAllowedToSendsFundsMapping[msg.sender]){
            if(this.balance>= amount){
                if(!receiver.send(amount)){
                    throw;
                }
                withdraw(msg.sender, amount, receiver);
                return this.balance;
            }
        }
    }

    function allowAddressToSendMoney(address _address){
        if(msg.sender == owner){
            isAllowedToSendsFundsMapping[_address]=true;
        }
    }

    function disallowAddressToSendMoney(address _address){
        if(msg.sender == owner){
            isAllowedToSendsFundsMapping[_address]=false;
        }
    }

    function isAllowedToSend(address _address) constant returns (bool){
        return isAllowedToSendsFundsMapping[_address]|| msg.sender == owner;
    }

    function killWallet(){
        if(msg.sender == owner){
            selfdestruct(owner);
        }
    }


}
