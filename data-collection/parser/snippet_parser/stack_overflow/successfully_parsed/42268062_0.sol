   pragma solidity ^0.4.0;
    contract Contract {
        address public someAddress;
        function storeAddress(address someAddress_){
            someAddress = someAddress_;
        }
    }
