pragma solidity ^0.7.0;
contract peertopeer {
    

    enum State { None, Initiated, Confirmed }

    enum TransactionType { Unknown, Deposit, Withdrawal }
    uint toyprice;
     
    struct Transfer {
        address buyer;
        address seller;
        
        uint fromAccount;
        uint toAccount;
        uint amount;
        TransactionType txnType;
        State state;
        uint timestamp;
    }
    
    
    mapping (bytes32 => Transfer) transfers;

    
    event TransferRequested(address buyer, address seller,  bytes32 transferId);
    event TransferConfirmed(address buyer, bytes32 transferId);
    event SimpleEvent();


    function sendSimpleEvent ()public returns (bool) {
     emit   SimpleEvent();
        return true;
    }

        
     function settoyprice(uint _toyprice) public {
        toyprice =_toyprice;
     }
     
     
     function  gettoyprice( )public view returns(uint){
         return toyprice;
     }
    function requestTransfer(uint fromAccount, address seller, uint toAccount, uint amount, TransactionType transactionType) public{
    
    if (transactionType == TransactionType.Unknown) return;

        SimpleEvent();
        
        bytes32  transferId =sha256(abi.encodePacked(msg.sender, seller, fromAccount, toAccount, amount, block.timestamp));
        Transfer memory transfer = transfers[transferId];

        
        if (transfer.state != State.None) return;

        transfer.buyer           = msg.sender;
        transfer.seller          = seller;
        transfer.fromAccount    = fromAccount;
        transfer.toAccount      = toAccount;
        transfer.amount         = amount;
        transfer.txnType    = transactionType;
        transfer.state          = State.Initiated;
        transfer.timestamp  = block.timestamp;

        
        TransferRequested(msg.sender, seller, transferId);
    }

    
    function confirmTransfer(bytes32 transferId)public  returns (bool) {
        Transfer memory transfer = transfers[transferId];
        if (msg.sender != transfer.seller || transfer.state != State.Initiated) return false;
        
        transfer.state = State.Confirmed;

        
        TransferConfirmed(transfer.buyer, transferId);
        
        return true;
    }

    
    
    function getFrom(bytes32 transferId)public view returns (address ) {
        Transfer memory transfer = transfers[transferId];
         if (msg.sender != transfer.seller && msg.sender != transfer.buyer)   return address(0x00);
        return transfer.buyer;
    }
    function getTo(bytes32 transferId)public view returns (address) {
        Transfer memory transfer = transfers[transferId];
     if (msg.sender != transfer .seller && msg.sender != transfer .buyer)  return address(0x00);
        return transfer.seller;
    }
    function getFromAccount(bytes32 transferId)public view returns (uint) {
        Transfer memory transfer = transfers[transferId];
        if (msg.sender != transfer.seller && msg.sender != transfer.buyer) return 0;
        return transfer.fromAccount;
    }
    function getToAccount(bytes32 transferId)public view returns (uint) {
        Transfer memory transfer = transfers[transferId];
        if (msg.sender != transfer.seller && msg.sender != transfer.buyer) return 0;
        return transfer.toAccount;
    }
    function getAmount(bytes32 transferId)public view returns (uint) {
        Transfer memory transfer = transfers[transferId];
        if (msg.sender != transfer.seller && msg.sender != transfer.buyer) return 0;
        return transfer.amount;
    }
    function getState(bytes32 transferId)public view returns (State) {
        Transfer memory transfer = transfers[transferId];
        if (msg.sender != transfer.seller && msg.sender != transfer.buyer) return State.None;
        return transfer.state;
    }
    function getTransactionType(bytes32 transferId)public view returns (TransactionType) {
        Transfer memory transfer = transfers[transferId];
        if (msg.sender != transfer.seller && msg.sender != transfer.buyer) return TransactionType.Unknown;
        return transfer.txnType;
    }
    function getTimestamp(bytes32 transferId)public view returns (uint ) {
        Transfer memory transfer = transfers[transferId];
        if (msg.sender != transfer.seller && msg.sender != transfer.buyer) return 0;
        return transfer.timestamp;
    }
}
