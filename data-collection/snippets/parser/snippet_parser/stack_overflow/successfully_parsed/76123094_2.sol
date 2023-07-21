
pragma solidity ^0.8.18;

contract NativeCoinUnits {
    
    
    
    uint256 public oneWei = 1 wei;
    bool public isOneWei = (oneWei == 1);
    uint256 public oneEther = 1 ether;
    bool public isOneEther = (oneEther == 1e18);

    
    
    
    uint256 public oneTinybar = 1;
    bool public isOneTinybar = (oneTinybar == 1);
    uint256 public oneHbar = 100_000_000; 
    bool public isOneHbar = (oneHbar == 1e8);
}

