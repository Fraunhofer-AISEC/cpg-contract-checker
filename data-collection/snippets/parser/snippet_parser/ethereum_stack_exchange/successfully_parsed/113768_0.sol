function _check() internal returns(bool success) {
        for (uint i = 0; i<registered.length; i++ ) {
            if(registered[i] == msg.sender) {
                return true;
            } else {
            return false;
            }
        }
        
     }
