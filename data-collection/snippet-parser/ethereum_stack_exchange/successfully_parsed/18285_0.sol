pragma solidity ^0.4.8;

import "./Owned.sol";
import "./Data.sol";
import "./Util.sol"; 

contract Remittance is Owned {
    Data.LockBoxes lockBox; 
    Data.LockBoxIndex lockBoxIndex;

    modifier stopInEmergency 
    { 
        if(stopped) throw;
        _; 
    }

    function createLockBox(
        address _receiver,
        bytes32 _password1, 
        bytes32 _password2)   
        stopInEmergency      
        payable
        public 
        returns (bool)
    {
        uint amount = msg.value - ownerFee;         

        
        if(Data.insert(lockBox, lockBoxIndex, _receiver, msg.sender, amount, _password1, _password2))
        {
            LogLockBoxCreated(_receiver, amount, true);
            deposit(owner, ownerFee);            
            return true;
        } 
        else 
        {
            LogLockBoxCreated(_receiver, amount, false);
            throw;
        }
    }    
}