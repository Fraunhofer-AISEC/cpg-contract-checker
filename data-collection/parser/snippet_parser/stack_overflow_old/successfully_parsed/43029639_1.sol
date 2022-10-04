pragma solidity ^0.4.0;

contract Agent {

address owner;


function Agent() { owner = msg.sender; }


function kill() { if (msg.sender == owner) selfdestruct(owner); }
}

contract AccountManager is Agent {
enum ACTIVE { Y, N } 
enum STATUS { CREDIT, DEBIT }
mapping (address => Account) public accounts;

struct Account {
    bytes32 ssn;
    int balance;
    ACTIVE active;
    STATUS status;
}

modifier withdrawValidation(int withdrawAmt) {
    if( withdrawAmt <= accounts[msg.sender].balance)  {
        throw;
    }
    _;
}


modifier transferValidation(address _from, address _to, bytes32 _ssn) {
    if( AccountManager(_from).getSSN() != _ssn || 
            AccountManager(_to).getSSN() != _ssn || 
                AccountManager(_from).getStatus() == STATUS.CREDIT )  {
        throw;
    }
    _;
}

function register(bytes32 _ssn) public returns (bool success) {
    Account memory newRegistree;
    newRegistree.ssn = _ssn;
    newRegistree.balance = 0;
    newRegistree.active = ACTIVE.Y;
    newRegistree.status = STATUS.DEBIT;
    accounts[msg.sender] = newRegistree;
    return true;
}

function update(bytes32 _ssn) public returns (bool success) {
    accounts[msg.sender].ssn = _ssn;
    return true;
}

function deposit(int _depositAmt) public returns(bool success) {
    accounts[msg.sender].balance += _depositAmt;
    return true;
}

function withdraw(int _withdrawAmt) public returns(bool success) {
    accounts[msg.sender].balance = (accounts[msg.sender].balance - _withdrawAmt);
    return true;
}

function getBalance() public constant returns(int balance) {
    return accounts[msg.sender].balance;
}

function setBalance(int _balance) external returns(bool success) {
    accounts[msg.sender].balance = _balance;
    return true;
}

function setStatus() internal {
    if(accounts[msg.sender].balance >= 0)
        accounts[msg.sender].status = STATUS.DEBIT;
    else 
        accounts[msg.sender].status = STATUS.CREDIT;
}

function getStatus() external constant returns (STATUS status) {
    return accounts[msg.sender].status;
}

function getSSN() external constant returns(bytes32 ssn) {
    return accounts[msg.sender].ssn;
}

function getAccount() public constant returns (bytes32 ssn, int balance, ACTIVE active, STATUS status) {
    return (accounts[msg.sender].ssn, accounts[msg.sender].balance, accounts[msg.sender].active, accounts[msg.sender].status);
}
}

contract TransferAgent is Agent {
function transfer(address _from, address _to) public returns (bool success) {
    AccountManager(_from).setBalance(100); 
    AccountManager(_to).setBalance(200); 
}
}