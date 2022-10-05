pragma solidity ^0.4.20;

contract T{
    mapping (address => bool) validAddresses;
    function set() external{
        validAddresses[0xca35b7d915458ef540ade6068dfe2f44e8fa733c] = true;
    }
    function c() external{
        validAddresses[0xca35b7d915458ef540ade6068dfe2f44e8fa733c] = false;
        
        
    }
    function d() external{
        delete validAddresses[0xca35b7d915458ef540ade6068dfe2f44e8fa733c];
        
        
    }
}
