struct transacttest{
    address to;
    address from;
    uint amt;
}

mapping(address => transacttest) transactionstest;

function addTransactiontest(address _to) payable{

    transactionstest[_to].from = msg.sender;
    transactionstest[_to].amt = msg.value;
    transactionstest[_to].to = _to;

}

function getTransactionDetailstest(address _to) constant returns(address, address, uint){

    return (transactionstest[_to].from, transactionstest[_to].to, 
    transactionstest[_to].amt);

}
