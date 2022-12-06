pragma solidity ^0.7.6;
contract Bench {
    
    uint256 public data;
    
    function increment() public {
        uint256 gasUsed = gasleft();
        uint256 dataLocal = data;
        gasUsed -= gasleft();
        dataLocal += gasUsed;
        data = dataLocal;
    }
    
}
