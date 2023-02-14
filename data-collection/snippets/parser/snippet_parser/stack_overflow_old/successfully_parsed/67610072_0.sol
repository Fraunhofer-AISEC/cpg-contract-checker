pragma solidity ^0.8;

interface B {
    
    function data(uint256 index) external returns (address);
}

contract A {
    
    function getContractBFirstItem() external returns (address) {
        B memory b = B(address(0x456));

        
        address firstItem = b.data(0);

        return firstItem;
    }
}
