>  modifier txExists(uint _txIndex) {
>     require(_txIndex < transactions.length, "tx does not exist");
>     _;
>      }

modifier notExecuted (uint _txIndex) {
    require(!transactions[_txIndex].executed, "tx already executed");
    _;    
    
}

modifier notConfirmed (uint _txIndex) {
    require(!transactions[_txIndex].isConfirmed[msg.sender], "tx already confirmed");
    _;
}

function confirmTransaction(uint _txIndex) 
public 
onlyOwner
txExists(_txIndex)
notExecuted(_txIndex)
notConfirmed(_txIndex)
{
 
