pragma solidity 0.4.24;
pragma experimental ABIEncoderV2;
pragma experimental "v0.5.0";

import "./LibOptIn.sol";


library LibOptInList {
    using LibOptIn for LibOptIn.OptIn;

    struct OptInList {
        mapping (address => uint256) balances;
        LibOptIn.OptIn[50] optIns;
    }

    
    function insert(
        OptInList storage self, 
        address addr, 
        uint256 value
    ) 
    internal 
    returns (LibOptIn.OptIn)
    {
        LibOptIn.OptIn memory displacedOptIn;
        uint256 i = 0;
        
        for (i; i < self.optIns.length; i++) {
            if (self.optIns[i].balance < value) {
                break;
            }
        }

        
        if (i == 0 && value < self.optIns[0].balance) { 
            revert("Value is not high enough"); 
        }

        if (self.optIns[self.optIns.length-1].addr != address(0)) {
            displacedOptIn = self.optIns[self.optIns.length-1];
        }

        
        for (uint256 j = self.optIns.length - 1; j > i; j--) {
            self.optIns[j].balance = self.optIns[j - 1].balance;
            self.optIns[j].addr = self.optIns[j - 1].addr;
        }

        
        self.optIns[i].balance = value;
        self.optIns[i].addr = addr;

        
        self.balances[addr] = value;

        
        delete self.balances[displacedOptIn.addr];
        return displacedOptIn;
    }

    function remove(OptInList storage self, address addr) internal {
        uint256 i = 0;

        
        for (i; i < self.optIns.length; i++) {
            if (self.optIns[i].addr == addr) {
                break;
            }
        }

        
        if (i == 0 && self.optIns[0].addr != addr) { 
            revert("Address not in opt-in list."); 
        }

        
        for (uint256 j = i; j < self.optIns.length - 1; j++) {
            self.optIns[j].balance = self.optIns[j+1].balance;
            self.optIns[j].addr = self.optIns[j+1].addr;
        }

        
        delete self.optIns[self.optIns.length - 1];

        
        delete self.balances[addr];
    }

    function update(
        OptInList storage self, 
        address addr, 
        uint256 newVal
    ) 
    internal
    returns (LibOptIn.OptIn)
    {
        remove(self, addr);
        return insert(self, addr, newVal);
    }        
}
