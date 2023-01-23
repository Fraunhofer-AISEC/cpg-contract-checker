pragma solidity ^0.4.11;

contract Testing {

    uint max_val = 3 * 10 ** 18;
    bool finished = false;

    modifier notFinished() {
       if (finished)
           revert();
       _;
    }

    
    
    
    function receiveEth() notFinished() payable {

       
       if (msg.value + this.balance > max_val)
           revert();

       
       if (msg.value + this.balance == max_val)
           finished = true;

       
    }
}
