pragma solidity ^0.4.0;


contract DumbCoin1{

    address deployer;
    mapping(address=>uint) balances;

    function DumbCoin1(){

        deployer = msg.sender;

    }

    function giveCoins(uint amount, address receiver){

        if(msg.sender == deployer){
            
            balances[receiver] += amount;
        }
        else{
            throw;
        }

    }


    function viewBalance() returns (uint){

        return balances[msg.sender];

    }

}
