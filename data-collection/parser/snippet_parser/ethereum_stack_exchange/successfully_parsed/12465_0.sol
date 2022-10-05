pragma solidity ^0.4.8;

contract A {

    address destAdd;

    function A(address sendContractAddress)  {
        destAdd = sendContractAddress;
    }

    function () {
        uint transferAmt= this.balance;
        if (!msg.sender.call.value(transferAmt)()) throw; 
    }
}

contract B {

    function() {

            
            bool ret = msg.sender.call('0xabcdefgh');
            if (!ret) throw;
        }
}
