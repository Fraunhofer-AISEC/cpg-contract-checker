pragma solidity 0.5.0;

import "./ERC20.sol";

contract MultiSigWallet {

 
  mapping(address => uint) private _owners;

  uint constant MIN_SIGNATURES = 2;
  uint private transactionIdx;
  address payable private _commissionAddress;
  mapping(uint => address) private tokens;
  uint private currentToken;

  ERC20 private erc20iface;

  struct Transaction {
    address from;
    address payable to;
    address _contract;
    uint amount;
    uint  signatureCount;
    uint commission;
    mapping(address => uint) signatures;
  }

  mapping(uint => Transaction) private _transactions;
  uint[] private _pendingTransactions;






  modifier validOwner() {

    require(_owners[msg.sender] == 1);
    _;
  }

  event DepositFunds(address from, uint amount);
  event TransactionCreated(address from, address to, uint amount, uint transactionId);
  event TransactionCompleted(address from, address to, uint amount, uint transactionId);
  event TransactionSigned(address by, uint transactionId);
  event TransferFailed(address from, address to, uint amount, uint transactionId);

  constructor(address service, address payable commissionAddress, address token) public {
   
    _commissionAddress = commissionAddress;
    _owners[msg.sender] = 1;
    _owners[service] = 1;

    currentToken = 0;
    tokens[currentToken] = token;
    currentToken++;
  }

  function () external payable
  {
    emit DepositFunds(msg.sender, msg.value);
  }

  function withdraw(uint amount, uint commission, address token)
    public
      {
    transferTo(msg.sender,  amount, commission, token);
  }

  function transferTo(address payable to, uint amount, uint commission, address token)
    validOwner
    public
      {
    
    require(amount > 0);

    uint transactionId = transactionIdx++;

    Transaction memory transaction;
    transaction.from = msg.sender;
    transaction.to = to;
    transaction._contract = token;
    transaction.commission = commission;
    transaction.amount = amount;
    transaction.signatureCount = 0;

    _transactions[transactionId] = transaction;
    _pendingTransactions.push(transactionId);

    emit TransactionCreated(msg.sender, to, amount, transactionId);

    signTransaction(transactionId);
  }

  function getPendingTransactions()
    view
    validOwner
    public
    returns(uint[] memory)
    {
      return _pendingTransactions;
    }

  function signTransaction(uint transactionId)
    validOwner
    public
   {
    Transaction storage transaction = _transactions[transactionId];
    
    require(0x0000000000000000000000000000000000000000 != transaction.from);
    
    
    
    require(transaction.signatures[msg.sender] != 1);

    transaction.signatures[msg.sender] = 1;
    transaction.signatureCount++;

    emit TransactionSigned(msg.sender, transactionId);

    if(transaction.signatureCount >= MIN_SIGNATURES) {

      if(transaction._contract != 0x0000000000000000000000000000000000000000) {
        
        
        
        
        erc20iface =  ERC20(transaction._contract);
        erc20iface.transfer(transaction.to, transaction.amount);
        erc20iface.transfer(_commissionAddress, transaction.commission);
      } else {
        require(address(this).balance >= transaction.amount);
        (transaction.to).transfer(transaction.amount);
        _commissionAddress.transfer(transaction.commission);
      }

      emit TransactionCompleted(transaction.from, transaction.to, transaction.amount, transactionId);
      deleteTransaction(transactionId);
    }
  }

  function deleteTransaction(uint transactionId)
    validOwner
    public
    {
      uint replace = 0;
      assert(_pendingTransactions.length > 0);
      for(uint i = 0; i < _pendingTransactions.length; i++) {
        if(replace == 1) {
          _pendingTransactions[i-1] = _pendingTransactions[i];
        } else if (transactionId == _pendingTransactions[i]) {
          replace = 1;
        }
    }
      assert(replace == 1);
      delete _pendingTransactions[_pendingTransactions.length - 1];
      _pendingTransactions.length--;
      delete _transactions[transactionId];
    }

  function walletBalance()
    view
    public
    returns (uint) {
      return address(this).balance;
    }

}
