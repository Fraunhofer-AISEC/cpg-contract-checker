pragma solidity 0.4.19;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import 'zeppelin-solidity/contracts/lifecycle/Destructible.sol';


contract SingleTx is Ownable, Destructible {

  
  mapping (uint => Transaction) public transactions;
  address[] public owners;


  struct Transaction {
      address destination;
      uint value;
      bytes data;
      bool executed;
  }

  
  
  function executeTransaction(uint transactionId)
      public
      ownerExists(msg.sender)
      confirmed(transactionId, msg.sender)
      notExecuted(transactionId)
  {
      if (isConfirmed(transactionId)) {
          Transaction storage txn = transactions[transactionId];
          txn.executed = true;
          if (txn.destination.call.value(txn.value)(txn.data)) {
                destroyContract();
              }
          else {
              txn.executed = false;
          }
      }
  }

  
  function destroyContract()
      private
  {
    ContractDestroyed();
    destroyAndSend(owners[0]);
  }

}
