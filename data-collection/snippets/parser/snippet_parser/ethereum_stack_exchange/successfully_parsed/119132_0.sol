
pragma solidity^0.8.10;

contract MultiSigWallet{
    event Deposit(address indexed sender ,uint value ,uint balance);
    event eventSubmitTransaction(
        address indexed sender,
        address indexed to,
        uint indexed txIndex,
        bytes data,
        uint value
        );
    event eventConfirmTransaction(address indexed owner, uint indexed txIndex);
    event eventExecuteTransaction(address indexed owner, uint indexed txIndex);
    event eventRevokeTransaction(address indexed owner, uint indexed txIndex);
    
    fallback() external payable{
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }
    function deposit() external payable{
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    address[] public owners;
    mapping(address=>bool) validOwner;
    uint public numOfConfirmationsRequired;
    struct Transaction{
        address from;
        address to;
        uint txIndex;
        bytes data;
        uint value;
        mapping(address=>bool) isConfirmed;
        bool executed;
        uint numConfirmations;
    }
    Transaction[] public transactions;

    constructor(address[] memory _owners,uint _numOfCofirmationsRequired){
        require(_owners.length>0,"Owners array con not be zero");
        require(_numOfCofirmationsRequired>0 && _numOfCofirmationsRequired<=_owners.length,"Num of confirations required should be valid");
        numOfConfirmationsRequired=_numOfCofirmationsRequired;
        for(uint i=0; i<_owners.length; i++){
            require(_owners[i]==address(_owners[i]),"Invalid owner address");
            require(!validOwner[_owners[i]],"You can't repeat owner addresses");
            owners.push(_owners[i]);
            validOwner[_owners[i]]=true;
        }
    }

    modifier onlyOwner(){
        require(validOwner[msg.sender],"Only owner can call");
        _;
    }
    modifier txExists(uint _txIndex){
        require(_txIndex< transactions.length,"Transaction index do not exists");
        _;
    }
    modifier notExecuted(uint _txIndex){
        require(!transactions[_txIndex].executed,"Transaction already executed");
        _;
    }
    modifier notConfirmed(uint _txIndex){
        require(!transactions[_txIndex].isConfirmed[msg.sender],"Transaction already confirmed");
        _;
    }
    function submitTransaction(address _to,uint _value, bytes memory _data) public onlyOwner{
        uint txlen =transactions.length;
        
        transactions.push();
        Transaction storage t =transactions[txlen]; 
        t.from=msg.sender;
        t.to=_to;
        t.txIndex=txlen;
        t.data=_data;
        t.value=_value;
        t.executed=false;
        t.numConfirmations=0;
        emit eventSubmitTransaction(msg.sender, _to, txlen, _data, _value);
    }
    function confirmTransaction(uint _txIndex)public onlyOwner txExists(_txIndex) notConfirmed(_txIndex) notExecuted(_txIndex){
        Transaction storage t =transactions[_txIndex];
        t.isConfirmed[msg.sender]=true;
        t.numConfirmations+=1;
        emit eventConfirmTransaction(msg.sender,_txIndex);
    }
    function executeTransaction(uint _txIndex)public onlyOwner txExists(_txIndex) notExecuted(_txIndex){
        Transaction storage t=transactions[_txIndex];
        require(t.numConfirmations>=numOfConfirmationsRequired,"Not enough pepole confirmed");
        t.executed=true;
        (bool success,) =(t.to).call{value:t.value}(t.data);
        require(success,"Transaction failed");
        emit eventExecuteTransaction(msg.sender,_txIndex);

    }
    function revokeTransaction(uint _txIndex)public onlyOwner txExists(_txIndex) notExecuted(_txIndex){
        Transaction storage t= transactions[_txIndex];
        require(t.isConfirmed[msg.sender],"You haven't confirmed this transaction");
        t.isConfirmed[msg.sender]=false;
        t.numConfirmations-=1;
        emit eventRevokeTransaction(msg.sender,_txIndex);
    }
}
