pragma solidity ^0.5.6.0;

    contract peInKSub{
      bytes32 [] m_pendingIndex ; 
      struct pendingConfirmation{
         bytes32 index;
         uint yetNeeded;
         bytes32 pendingOp;
      }
    
      pendingConfirmation pending;
    
      function confirmAndCheck ( bytes32 _operation )public returns ( bool ) { 
        pending.pendingOp = m_pendingIndex [ _operation ];
        
        
        if ( pending . yetNeeded == 0) { 
          pending . index =  m_pendingIndex[_operation] . length ++;
          
        }
      }
    }
