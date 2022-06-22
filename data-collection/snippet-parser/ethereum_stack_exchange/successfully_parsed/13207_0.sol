pragma solidity ^0.4.9;


contract ReceiveEther {

    address receivingAccount;
    uint deadline;
    event EtherReceival(address sender, uint amount);
    event ContractDisposed(string contractName, uint time);

    
    function ReceiveEther(address _account) {
        
        receivingAccount = _account;
        
        deadline = now + 10 * 1 minutes;
    }   

    
    function () public payable {
        uint amount = msg.value;
        receivingAccount.send(amount);
        EtherReceival(msg.sender, amount);
    }

    modifier afterDeadline() { if (now >= deadline) _; }

    
    function dispose() afterDeadline {
        ContractDisposed("ReceiveEther", now);
        suicide(receivingAccount);
    }
}
