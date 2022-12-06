pragma solidity ^0.4.17;

contract mysmartContract{


        function whitdrawETH() payable public {

        }

        function getContactEthBalance() constant returns(uint) {

        return this.balance;
        }

    }
