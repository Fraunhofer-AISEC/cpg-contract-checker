    
    pragma solidity ^0.8.0;
    
    interface InterfaceA {
        function count() external view returns (uint256);
        function increment() external;
    }
    
    contract contractA {
        uint256 number = 0;
    
       function count() external view returns (uint256) {
          return number;
       }
    
       function increment() external {
          number++ ;
       }
    }
