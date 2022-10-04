pragma solidity ^0.4.11;

    contract A{
        uint a =10;
        address owner;
        function A(){
            owner = msg.sender;
        }
        modifier onlyOwner(){
            require(msg.sender == owner);
            _;
        }

        function updateValue(uint a) onlyOwner {
            a = a+10;
        }
    }
