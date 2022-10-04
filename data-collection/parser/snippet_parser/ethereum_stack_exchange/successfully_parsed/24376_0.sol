struct transact{
    address to;
    address from;
    uint amt;
    uint256 timeStamp ;
}

mapping(string => transact) transactions;


function addTransaction(string _transactionId, uint256 _timestamp, address _to) payable{

    transactions[_transactionId].from = msg.sender;
    transactions[_transactionId].amt = msg.value;
    transactions[_transactionId].to = _to;
    transactions[_transactionId].timeStamp = _timestamp;

}

function getTransactionDetails(string _transactionId) constant returns(address, address, uint, uint256){

    return (transactions[_transactionId].from, transactions[_transactionId].to, 
    transactions[_transactionId].amt, transactions[_transactionId].timeStamp);

}
