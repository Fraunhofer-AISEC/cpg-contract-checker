pragma solidity ^0.4.8;

contract Bank{       

    address public owner;
    uint public receivedWei;
    uint public returnedWei;

    

    struct Client {
        uint received;
        uint returned;
        uint clientListPointer;
    }

    mapping(address => Client) public clientStructs;
    address[] public clientList;

    event LogReceivedFunds(address sender, uint amount);
    event LogReturnedFunds(address recipient, uint amount);

    function Bank() {
        owner = msg.sender;
    }

    function getClientCount()
        public 
        constant
        returns(uint clientCount)
    {
        return clientList.length;
    }

    function isClient(address client)
        public
        constant
        returns(bool isIndeed)
    {
        if(clientList.length==0) return false;
        return clientList[clientStructs[client].clientListPointer]==client;
    }

    function pay() payable 
        public
        returns(bool success)
    {
        
        if(!isClient(msg.sender)) {
            clientStructs[msg.sender].clientListPointer = clientList.push(msg.sender)-1;
        }
        
        clientStructs[msg.sender].received += msg.value;
        receivedWei += msg.value;
        LogReceivedFunds(msg.sender, msg.value);
        return true;
    }

    function payMeBack(uint amountToWithdraw) 
        public
        returns(bool success)
    {
        
        if(!isClient(msg.sender)) throw;

        
        uint netOwed = clientStructs[msg.sender].received - clientStructs[msg.sender].returned;

        
        if(amountToWithdraw > netOwed) throw;

        

        
        
        clientStructs[msg.sender].returned += amountToWithdraw;

        
        returnedWei += amountToWithdraw;
        LogReturnedFunds(msg.sender, amountToWithdraw);
        if(!msg.sender.send(amountToWithdraw)) throw;
        return true;
    }
}
