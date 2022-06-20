function confirmAndCheck(bytes32 _operation) internal returns (bool) {
        
        uint ownerIndex = m_ownerIndex[uint(msg.sender)];
        
        if (ownerIndex == 0) return;

        var pending = m_pending[_operation];
        
        if (pending.yetNeeded == 0) {
            
            pending.yetNeeded = m_required;
            
            pending.ownersDone = 0;
            pending.index = m_pendingIndex.length++;
            m_pendingIndex[pending.index] = _operation;
        }
        
        uint ownerIndexBit = 2**ownerIndex;
        
        if (pending.ownersDone & ownerIndexBit == 0) {
            Confirmation(msg.sender, _operation);
            
            if (pending.yetNeeded <= 1) {
                
                delete m_pendingIndex[m_pending[_operation].index];
                delete m_pending[_operation];
                return true;
            }
            else
            {
                
                pending.yetNeeded--;
                pending.ownersDone |= ownerIndexBit;
                
            }
        }
    }
