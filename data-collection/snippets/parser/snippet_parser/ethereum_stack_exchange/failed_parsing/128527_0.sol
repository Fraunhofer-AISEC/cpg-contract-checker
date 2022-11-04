
pragma solidity ^0.8.9;
    
contract MyContract{
        address[] public myAddresses;
    
        function getMyAddresses() public view returns(address[] [[memory? / storage?]]){
            return myAddresses;
        }
    }
