    
    pragma solidity ^0.8.0;
    
    import './contractA.sol' ;
    
    contract contractB {    
        address addressA;   
        constructor (address _addressA) {
              addressA = _addressA;
        }
    
        function getCount() external view returns (uint256) {
             InterfaceA b = InterfaceA(addressA);
             return b.count();
        }
    
        function addToIncrement() external {
             InterfaceA b = InterfaceA(addressA);
             b.increment();
        }
    }
