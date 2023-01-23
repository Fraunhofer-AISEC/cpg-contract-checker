contract MultiSig {


address[] public owners;
uint256 requiredVoteCount;

event Deposit(uint256 amount);
event Approved(address approverOwner, uint256 approvedTransaction);
event ExecuteTransaction(uint256 txId, uint256 amount);
event CreateTransaction(address creator);

struct Transaction{
    
    address creator;
    address to;
    uint256 amount;
    uint256 voteCount;
    bool executed;
}

constructor(address[] memory  _owners, uint256 _requiredVoteCount) {
    require(_owners.length >=2);

    
    for(uint i; i<_owners.length; i++){
        address owner = _owners[i];
        require(owner != address(0));
        owners.push(owner);
        isOwner[owner] = true;
    }
    requiredVoteCount = _requiredVoteCount;

}

modifier notExecuted(uint256 transactionId) {
    require(transactions[transactionId].executed == false, "Transaction is already executed, you cant revoke");
    _;
}

modifier onlyOwners() {
   require(isOwner[msg.sender] == true, "You arent a owner");
   _;
}

modifier transactionExist(uint256 transactionId){
    require(transactionId ==walletNonce);
    _;
}



uint256 public walletNonce;


mapping(address => mapping(uint256 => bool)) public isApproved;

mapping(uint256 => Transaction) public transactions;
mapping(address => bool) public isOwner;

function createTxProposal(address _to, uint256 _amount) public onlyOwners {
    transactions[walletNonce] = Transaction(msg.sender,_to, _amount,0,false);
    emit CreateTransaction(msg.sender);
}


function approveTransaction(uint256 _txId) 
    public
    onlyOwners 
    notExecuted(_txId) 
    transactionExist(_txId)
{
    require(isApproved[msg.sender][_txId] == false, "You have already approved");
    transactions[_txId].voteCount +=1;
    isApproved[msg.sender][_txId] = true;

}


function cancelApprove(uint256 _txId)
    public
    onlyOwners
    notExecuted(_txId)
    transactionExist(_txId)
{
    require(isApproved[msg.sender][_txId] == true,
    "You havent approved this transaction"
    );
    
    transactions[_txId].voteCount -=1;
    isApproved[msg.sender][_txId] = false;
}

function executeTransaction(uint256 _txId)
    public
    onlyOwners
    notExecuted(_txId)
    transactionExist(_txId)
{
    require(transactions[_txId].voteCount >= requiredVoteCount,
     "The Transaction didnt voted enough"
    );

    transactions[_txId].executed = true;
    uint  value = transactions[_txId].amount;
    

    (bool sent, ) = transactions[_txId].to.call{value: value}("");
    require(sent == true, "transaction couldnt executed");
    walletNonce +=1;
    emit ExecuteTransaction(_txId,transactions[_txId].amount);
   
}

function showApprovalCount(uint256 _txId) public view returns(uint256) {
    return transactions[_txId].voteCount;
}

function showBalance() public view  returns(uint256) {
    return address(this).balance;
}



receive() external payable {
    emit Deposit(msg.value);
}}
