pragma solidity ^0.4.18;

contract mortal{

    address owner;

    function mortal(){

        owner = msg.sender;
    }

    modifier onlyOwner{

        if (msg.sender != owner){
            throw;
        }
    }

    function kill() onlyOwner{

        suicide(owner);
    }
}
