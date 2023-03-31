

struct Transactions {
    address to;
    uint256 _value;
    
    bool isExecuted;
    uint256 numOfConfirmation;
}

Transactions[] public transactionArr;

function submitTransaction(uint256 _value,address _to) public onlyOwner returns(bool success){

    uint txIndex  = transactionArr.length;

    transactionArr.push(Transactions({
        _value:_value,
        to: _to,
        isExecuted:false,
        numOfConfirmation:0
        }));
    

    emit submitTransactions(_value, txIndex, _to);

    success = true;
    
}
