
pragma solidity ^0.8.10;

contract MultiSigWallet {
    event Deposit(address indexed sender, uint256 amount, uint256 balance);
    event SubmitTransaction(uint256 indexed txId);
    event ApproveTransaction(address indexed owner, uint256 indexed txId);
    event RevokeTransaction(address indexed owner, uint256 indexed txId);
    event ExecuteTransaction(uint256 indexed txId);

    struct Transaction {
        address payable to;
        uint256 amount;
        bytes data;
        bool executed;
        uint256 numConfirmations;
    }

    Transaction[] public transactions;

    address[] owners;
    mapping(address => bool) isOwner;

    
    mapping(uint256 => mapping(address => bool)) approved;
    mapping(uint256 => bool) executed;
    uint256 confirmationsRequired;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "You are not an owner");
        _;
    }

    modifier txNotApproved(uint256 _txId) {
        require(
            !approved[_txId][msg.sender],
            "The transaction is already approved"
        );
        _;
    }

    modifier txNotExecuted(uint256 _txId) {
        require(
            !transactions[_txId].executed,
            "The transaction has been already executed"
        );
        _;
    }

    modifier txExists(uint256 _txId) {
        require(
            transactions.length >= _txId,
            "The transaction does not exists"
        );
        _;
    }

    constructor(address[] memory _owners, uint256 _confirmationsRequired) {
        require(_owners.length > 0, "Owners needs to be greater than 0");
        require(
            _confirmationsRequired > 0,
            "Owners required needs to be greater than 0"
        );
        for (uint256 i = 0; _owners.length > i; i++) {
            address _owner = _owners[i];
            require(_owner != address(0));
            isOwner[_owners[i]] = true;
        }
        owners = _owners;
        confirmationsRequired = _confirmationsRequired;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function submitTransaction(
        uint256 _amount,
        address payable _to,
        bytes memory _data
    ) public onlyOwner {
        transactions.push(
            Transaction({
                to: _to,
                amount: _amount,
                data: _data,
                executed: false,
                numConfirmations: 0
            })
        );
        uint256 txIndex = transactions.length;

        emit SubmitTransaction(txIndex);
    }

    function approveTransaction(uint256 _txId)
        public
        onlyOwner
        txExists(_txId)
        txNotApproved(_txId)
        txNotExecuted(_txId)
    {
        transactions[_txId].numConfirmations += 1;
        approved[_txId][msg.sender] = true;

        emit ApproveTransaction(msg.sender, _txId);
    }

    function revokeConfirmation(uint256 _txId)
        public
        onlyOwner
        txExists(_txId)
        txNotExecuted(_txId)
    {
        require(
            approved[_txId][msg.sender] = true,
            "This Transaction is not approved by the msg.sender"
        );
        approved[_txId][msg.sender] = false;

        emit RevokeTransaction(msg.sender, _txId);
    }

    function executeTransaction(uint256 _txId)
        public
        payable
        onlyOwner
        txNotExecuted(_txId)
        txExists(_txId)
    {
        Transaction storage transaction = transactions[_txId];
        require(
            transaction.numConfirmations >= confirmationsRequired,
            "Not enough confirmations from the Owners"
        );

        transaction.executed = true;
        uint256 _transactionAmount = transaction.amount;
        address payable _to = transaction.to;
        _to.transfer(_transactionAmount);

        emit ExecuteTransaction(_txId);
    }

    function getOwners() public view returns (address[] memory) {
        return owners;
    }

    function checkExecuted(uint256 _txId) public view returns (bool) {
        return executed[_txId];
    }

    function getTransactions() public view returns (uint256) {
        return transactions.length;
    }

    function getConfirmations(uint256 _txId) public view returns (uint256) {
        return transactions[_txId].numConfirmations;
    }
}
