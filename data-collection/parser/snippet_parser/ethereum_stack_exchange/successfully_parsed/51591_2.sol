pragma experimental ABIEncoderV2;
pragma solidity 0.4.24;

    contract mycontract{

        mapping (address => string[]) myMap;

        function get(address _addr) public returns (string[]){
           return myMap[_addr];
        }

    }
