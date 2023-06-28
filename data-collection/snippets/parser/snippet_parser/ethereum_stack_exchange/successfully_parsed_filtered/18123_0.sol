pragma solidity ^0.4.4;

    contract Relay {
        address public currentVersion;
        address public owner;

        function Relay(address initAddr){
            currentVersion = initAddr;
            owner = msg.sender;
        }

        function update(address newAddress){
            if(msg.sender != owner) throw;
            currentVersion = newAddress;
        }

        function(){
            if(!currentVersion.delegatecall(msg.data)) throw;
        }
    }
